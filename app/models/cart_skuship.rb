class CartSkuship < ActiveRecord::Base
  belongs_to :order
  belongs_to :sku
  belongs_to :cart

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
    points[:rate]*promotion_subtotal.to_i+points[:points]
  end


  validates_presence_of :sku_id, :cart_id
  validates_numericality_of :quantity, :only_integer => true, :greater_than => 0

  protected
    def product_promotion_content(method,user)
      OnlinePromotion.promotion_content(OnlinePromotion.progress_product_promotions,
                                        OnlinePromotion.progress_order_promotions, method, :sku => sku, :user => user,
                                        :order_channel => 1, :site => "cart", :cart => cart)
    end
end
