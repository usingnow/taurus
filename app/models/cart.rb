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

  #
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

  def total_installation_amount
    cart_skuships.where("is_need_install = 1").to_a.sum do |cart_sku|
      cart_sku.sku.installation_cost_aft_tax
    end
  end

  #
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

  def total_assembling_amount
    cart_skuships.where("is_need_assemble = 1").to_a.sum do |cart_sku|
      cart_sku.sku.assembling_fee_aft_tax
    end
  end



  def total_nds_amount
    total_nds_sku_amount + total_nds_installation_amount + total_nds_assembling_amount
  end

  def promotion_total_nds_amount(user)
    promotion_nds_sku_amount(user) + promotion_total_nds_installation_amount(user) + promotion_total_nds_assembling_amount(user)
  end

  def total_amount
    total_sku_amount + total_installation_amount + total_assembling_amount
  end

  def short_supply_skus(store_id)
    str = ""
    cart_skuships.where("sku_id in (select id from skus where sku_type !=2)").each do |cart_sku|
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

  protected
    def promotion_content(method)
      result = {:promotion_gifts => [], :free_delivery => false}
      case method
      when :promotion_gifts
        current_promotions.each do |o|
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
        current_order_promotions.each do |p|
          result[:free_delivery] = true if p.online_promotionable.free_delivery == true
        end
      end
      result[method]
    end

    def current_promotions
      online_promotions = []
      back_order_skus.each do |c|
        OnlinePromotion.current_product_promotions(OnlinePromotion.progress_product_promotions,:sku => c.sku, :user => self, :order_channel => 2).each do |online_promotion|
          online_promotions << online_promotion unless online_promotions.map(&:id).member?(online_promotion.id)
        end
      end
      current_order_promotions.each do |p|
        online_promotions << p unless online_promotions.map(&:id).member?(p.id)
      end
      online_promotions
    end

    def current_order_promotions
      order_options = {:order_payment_over => admin_promo_price,
                       :purchase_amount_limit => admin_amount, :user => self,
                       :order_channel => 2, :procedure_id => inner_order_payment.procedure_id}
      OnlinePromotion.current_order_promotions(OnlinePromotion.progress_order_promotions,order_options)
    end
end
