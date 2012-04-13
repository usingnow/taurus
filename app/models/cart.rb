#encoding:UTF-8
class Cart < ActiveRecord::Base
  has_many :cart_skuships, :dependent => :destroy
  has_many :skus, :through => :cart_skuships
  has_many :po_product_temp_lists, :dependent => :destroy

  def add_po_product(product_id)
    current_po_product = po_product_temp_lists.find_by_product_id(product_id)
    if current_po_product
     current_po_product.product_purchase_amount += 1
    else
      current_po_product = po_product_temp_lists.build(:product_id => product_id)
    end
    current_po_product
  end

  def add_sku(sku_id,quantity)
    current_cart_sku = cart_skuships.find_by_sku_id(sku_id)
    if current_cart_sku
     current_cart_sku.quantity += quantity.to_i
    else
      current_cart_sku = cart_skuships.build(:sku_id => sku_id, :is_need_install => 0, :is_need_assemble => 0)
    end
    current_cart_sku
  end

  #采购单临时商品总金额
  def po_price
    po_product_temp_lists.to_a.sum { |list| list.product.cost_aft_tax*list.product_purchase_amount }
  end

  #所有商品数量
  def total_items(options={})
    if options[:sku_category_ids]
      cart_skuships.find_all { |c| options[:sku_category_ids].member?(c.sku.sku_category_id) }.sum { |c| c.quantity }
    elsif options[:brand_ids]
      cart_skuships.find_all { |c| options[:brand_ids].member?(c.sku.brand_id) }.sum { |c| c.quantity }
    elsif options[:sku_ids]
      cart_skuships.find_all { |c| options[:sku_ids].member?(c.sku_id) }.sum { |c| c.quantity }
    else
      cart_skuships.sum(:quantity)
    end
  end

  #非直送品数量
  def total_nds_items(options={})
    if options[:sku_category_ids]
      not_direct_sends.find_all { |c| options[:sku_category_ids].member?(c.sku.sku_category_id) }.sum { |c| c.quantity }
    elsif options[:brand_ids]
      not_direct_sends.find_all { |c| options[:brand_ids].member?(c.sku.brand_id) }.sum { |c| c.quantity }
    elsif options[:sku_ids]
      not_direct_sends.find_all { |c| options[:sku_ids].member?(c.sku_id) }.sum { |c| c.quantity }
    else
      not_direct_sends.sum(:quantity)
    end
  end

  #非直送品商品总价
  def total_nds_sku_amount
    not_direct_sends.to_a.sum do |cart_sku|
      cart_sku.quantity * cart_sku.sku.cost_aft_tax
    end
  end

  def promotion_nds_sku_amount(user)
    not_direct_sends.to_a.sum do |cart_sku|
      cart_sku.promotion_sku_price(user)
    end
  end

  #所有商品总价
  def total_sku_amount
    cart_skuships.to_a.sum do |cart_sku|
      cart_sku.quantity * cart_sku.sku.cost_aft_tax
    end
  end

  #非直送品安装费
  def total_nds_installation_amount
    cart_skuships.where("is_need_install = 1 and sku_id in (select id from skus where sku_type !=2)").to_a.sum do |cart_sku|
      cart_sku.sku.installation_cost_aft_tax
    end
  end

  def promotion_total_nds_installation_amount(user)
    cart_skuships.where("is_need_install = 1 and sku_id in (select id from skus where sku_type !=2)").to_a.sum do |cart_sku|
      cart_sku.promotion_installation_cost(user)
    end
  end

  #所有商品安装费
  def total_installation_amount
    cart_skuships.where("is_need_install = 1").to_a.sum do |cart_sku|
      cart_sku.sku.installation_cost_aft_tax
    end
  end

  #非直送品组装费
  def total_nds_assembling_amount
    cart_skuships.where("is_need_assemble = 1 and sku_id in (select id from skus where sku_type !=2)").to_a.sum do |cart_sku|
      cart_sku.sku.assembling_fee_aft_tax
    end
  end

  def promotion_total_nds_assembling_amount(user)
    cart_skuships.where("is_need_assemble = 1 and sku_id in (select id from skus where sku_type !=2)").to_a.sum do |cart_sku|
      cart_sku.promotion_assembling_fee(user)
    end
  end

  #所有商品组装费
  def total_assembling_amount
    cart_skuships.where("is_need_assemble = 1").to_a.sum do |cart_sku|
      cart_sku.sku.assembling_fee_aft_tax
    end
  end

  #所有非直送商品合计，除运费
  def total_nds_amount
    total_nds_sku_amount + total_nds_installation_amount + total_nds_assembling_amount
  end

  def promotion_total_nds_amount(user)
    promotion_nds_sku_amount(user) + promotion_total_nds_installation_amount(user) + promotion_total_nds_assembling_amount(user)
  end

  #所有商品总计,除运费
  def total_amount
    total_sku_amount + total_installation_amount + total_assembling_amount
  end

  #非直送品判断库存
  def short_supply_skus(store_id)
    str = ""
    not_direct_sends.each do |cart_sku|
      unless cart_sku.sku.inventory?(cart_sku.quantity,store_id)
        str += "【#{cart_sku.sku.name}】,"
      end
    end
    unless str.blank?
      str = str + "库存不足！"
    end
    str
  end


  def direct_sends
    cart_skuships.where("sku_id in(select id from skus where sku_type = 2)")
  end

  def not_direct_sends
    cart_skuships.where("sku_id in(select id from skus where sku_type != 2)")
  end


  #非直送品运费
  def nds_carriage_cost(city_no)
    carriage_cost = 0
    if city_no == 330200
      unless total_nds_amount > 50
        carriage_cost = 5
      end
    else
      unless total_nds_amount > 200
        carriage_cost = 20
      end
    end
    carriage_cost
  end

  def promotion_nds_carriage_cost(city_no,user)
    promotion_nds_content(:free_delivery,user) ? 0 : nds_carriage_cost(city_no)
  end

  def promotion_nds_points(user)
    not_direct_sends.to_a.sum { |nds| nds.promotion_sku_points(user) }
  end

  #非直送品礼品
  def nds_gifts(user)
    promotion_nds_content(:promotion_gifts,user)
  end

  def nds_promotion_ids(user)
    current_nds_promotions(user).map(&:id)
  end

  protected
    def promotion_nds_content(method,user)
      result = {:promotion_gifts => [], :free_delivery => false}
      case method
      when :promotion_gifts
        current_nds_promotions(user).each do |o|
          if o.sku_id
            gift = result[:promotion_gifts].find { |g| g.sku_id == o.sku_id }
            if gift
              gift.amount += 1
            else
              result[:promotion_gifts] << PromotionGift.new(:sku_id => o.sku_id)
            end
          end
        end
      when :free_delivery
        current_nds_order_promotions(user).each do |p|
          result[:free_delivery] = true if p.online_promotionable.free_delivery == true
        end
      end
      result[method]
    end

    def current_nds_promotions(user)
      online_promotions = []
      not_direct_sends.each do |c|
        current_nds_product_promotions(user,c.sku).each do |online_promotion|
          online_promotions << online_promotion unless online_promotions.map(&:id).member?(online_promotion.id)
        end
      end
      current_nds_order_promotions(user).each do |p|
        online_promotions << p unless online_promotions.map(&:id).member?(p.id)
      end
      online_promotions
    end

    #目前使用中的所有非直送品订单活动
    def current_nds_order_promotions(user)
      order_options = {:order_payment_over => promotion_total_nds_amount(user),
                       :purchase_amount_limit => total_nds_items, :user => user,
                       :order_channel => 1, :procedure_id => user.inner_order_payment.procedure_id}
      OnlinePromotion.current_order_promotions(OnlinePromotion.progress_order_promotions,order_options)
    end

    #目前使用中的所有非直送品商品活动
    def current_nds_product_promotions(user,sku)
      OnlinePromotion.current_product_promotions(OnlinePromotion.progress_product_promotions,:sku => sku,
                                                 :user => user, :order_channel => 1, :site => "cart_nds", :cart => self)
    end
end
