class BackOrderSku < ActiveRecord::Base
  belongs_to :sku
  belongs_to :user

  def subtotal
    sku_price + installation_cost + assembling_fee
  end

  def sku_price
    sku.cost_aft_tax*quantity
  end

  def installation_cost
    is_need_install ? sku.installation_cost_aft_tax : 0
  end

  def assembling_fee
    is_need_assemble ? sku.assembling_fee_aft_tax : 0
  end


  #参加活动后各属性
  def promotion_subtotal
    promotion_sku_price + promotion_installation_cost + promotion_assembling_fee
  end

  def promotion_unit_price
    product_promotion_content(:product_discount)*sku.cost_aft_tax
  end

  def promotion_sku_price
    promotion_unit_price*quantity
  end

  def promotion_installation_cost
    product_promotion_content(:free_installation) ? 0 : installation_cost
  end

  def promotion_assembling_fee
    product_promotion_content(:free_assembling) ? 0 : assembling_fee
  end

  def promotion_sku_points
    points = product_promotion_content(:points)
    points[:rate]*promotion_subtotal.to_i+points[:points]
  end

  validates_presence_of :sku_id, :user_id

  protected
    def product_promotion_content(method)
      OnlinePromotion.promotion_content(OnlinePromotion.progress_product_promotions,
                                        OnlinePromotion.progress_order_promotions, method, :sku => sku, :user => user,
                                        :order_channel => 2)
    end
end
