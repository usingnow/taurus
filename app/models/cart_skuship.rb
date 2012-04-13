class CartSkuship < ActiveRecord::Base
  belongs_to :order
  belongs_to :sku
  belongs_to :cart

  scope :direct_sends, where("sku_id in(select id from skus where sku_type = 2)")
  scope :not_direct_sends, where("sku_id in(select id from skus where sku_type != 2)")

  def total_amount
    amount = sku.cost_aft_tax * quantity
    if is_need_install?
      amount += sku.installation_cost_aft_tax
    end
    if is_need_assemble?
      amount += sku.assembling_fee_aft_tax
    end
    amount
  end

  #直送品运费
  def ds_carriage_cost(district_no)
    carriage_cost = 0
    city_no = District.find_by_number(district_no).city_no
    if city_no == 330200
      unless total_amount > 50
        carriage_cost = 5
      end
    else
      unless total_amount > 200
        carriage_cost = 20
      end
    end
    carriage_cost
  end

  def installation_cost
    is_need_install ? sku.installation_cost_aft_tax : 0
  end

  def assembling_fee
    is_need_assemble ? sku.assembling_fee_aft_tax : 0
  end

  def sku_price
    sku.cost_aft_tax*quantity
  end

  def subtotal
    installation_cost + assembling_fee + sku_price
  end

  #参加活动后各属性
  def promotion_subtotal(user)
    promotion_sku_price(user) + promotion_installation_cost(user) + promotion_assembling_fee(user)
  end

  def promotion_unit_price(user)
    product_promotion_content(:product_discount,user)*sku.cost_aft_tax
  end

  def promotion_sku_price(user)
    promotion_unit_price(user)*quantity
  end

  def promotion_installation_cost(user)
    product_promotion_content(:free_installation,user) ? 0 : installation_cost
  end

  def promotion_assembling_fee(user)
    product_promotion_content(:free_assembling,user) ? 0 : assembling_fee
  end

  def promotion_sku_points(user)
    points = product_promotion_content(:points,user)
    points[:rate]*promotion_subtotal(user).to_i+points[:points]
  end

  def promotion_ds_points(user)
    points = ds_product_promotion_content(:points,user)
    points[:rate]*promotion_ds_subtotal(user).to_i+points[:points]
  end

  def promotion_ds_unit_price(user)
    ds_product_promotion_content(:product_discount,user)*sku.cost_aft_tax
  end

  def promotion_ds_installation_cost(user)
    ds_product_promotion_content(:free_installation,user) ? 0 : installation_cost
  end

  def promotion_ds_assembling_fee(user)
    ds_product_promotion_content(:free_assembling,user) ? 0 : assembling_fee
  end

  def promotion_ds_subtotal(user)
    promotion_ds_unit_price(user)*quantity + promotion_ds_installation_cost(user) + promotion_ds_assembling_fee(user)
  end

  def promotion_ds_carriage_cost(district_no,user)
    promotion_ds_content(:free_delivery,user) ? 0 : ds_carriage_cost(district_no)
  end

  def ds_gifts(user)
    promotion_ds_content(:promotion_gifts,user)
  end

  def ds_promotion_ids(user)
    current_ds_promotions(user).map(&:id)
  end



  validates_presence_of :sku_id, :cart_id
  validates_numericality_of :quantity, :only_integer => true, :greater_than => 0

  protected
    def product_promotion_content(method,user)
      OnlinePromotion.promotion_content(OnlinePromotion.progress_product_promotions,
                                        OnlinePromotion.progress_order_promotions, method, :sku => sku, :user => user,
                                        :order_channel => 1, :site => "cart_nds", :cart => cart)
    end

    def ds_product_promotion_content(method,user)
      OnlinePromotion.promotion_content(OnlinePromotion.progress_product_promotions,
                                        OnlinePromotion.progress_order_promotions, method, :sku => sku, :user => user,
                                        :order_channel => 1, :site => "cart_ds", :cart_sku => self)
    end

    def promotion_ds_content(method,user)
      result = {:promotion_gifts => [], :free_delivery => false}
      case method
      when :promotion_gifts
        current_ds_promotions(user).each do |o|
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
        current_ds_order_promotions(user).each do |p|
          result[:free_delivery] = true if p.online_promotionable.free_delivery == true
        end
      end
      result[method]
    end

    def current_ds_promotions(user)
      online_promotions = []
      current_ds_product_promotions(user).each do |online_promotion|
        online_promotions << online_promotion unless online_promotions.map(&:id).member?(online_promotion.id)
      end
      current_ds_order_promotions(user).each do |p|
        online_promotions << p unless online_promotions.map(&:id).member?(p.id)
      end
      online_promotions
    end

    #目前使用中的该直送品订单活动
    def current_ds_order_promotions(user)
      order_options = {:order_payment_over => promotion_ds_subtotal(user),
                       :purchase_amount_limit => quantity, :user => user,
                       :order_channel => 1, :procedure_id => user.inner_order_payment.procedure_id}
      OnlinePromotion.current_order_promotions(OnlinePromotion.progress_order_promotions,order_options)
    end

    #目前使用中的该直送品商品活动
    def current_ds_product_promotions(user)
      OnlinePromotion.current_product_promotions(OnlinePromotion.progress_product_promotions,:sku => sku, :user => user,
                                                 :order_channel => 1, :site => "cart_ds", :cart_sku => self)
    end
end
