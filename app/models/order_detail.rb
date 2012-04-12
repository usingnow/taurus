#encoding:UTF-8
class OrderDetail < ActiveRecord::Base
  belongs_to :sku
  belongs_to :order

  def is_have_nb_store
    flag = 0
    sku.products.each do |product|
      product_storeship =  ProductStoreship.find_by_product_id_and_store_id(product.id,1)
      if product_storeship.nil?
        flag = 1
        break
      else
        if product_storeship.quantity < 1
          flag = 2
          break
        end
      end
    end
    if flag == 0
      "有库存"
    elsif flag == 1
      "无货物"
    else
      "无库存"
    end
  end

  def is_have_xs_store
    flag = 0
    sku.products.each do |product|
      product_storeship =  ProductStoreship.find_by_product_id_and_store_id(product.id,2)
      if product_storeship.nil?
        flag = 1
        break
      else
        if product_storeship.quantity < 1
          flag = 2
          break
        end
      end
    end

    if flag == 0
    "有库存"
    elsif flag == 1
    "无货物"
    else
    "无库存"
    end
  end

  def subtotal
    unit_price*quantity+installation_cost+assembling_fee
  end

  def installation_cost
    is_need_install ? install_cost : 0
  end

  def assembling_fee
    is_need_assemble ? assemble_cost : 0
  end

  def promotion_unit_price
    promotion_content(:product_discount)*unit_price
  end

  def promotion_installation_cost
    promotion_content(:free_installation) ? 0 : installation_cost
  end

  def promotion_assembling_fee
    promotion_content(:free_assembling) ? 0 : assembling_fee
  end

  def promotion_sku_price
    promotion_unit_price*quantity
  end

  def promotion_subtotal
    promotion_sku_price + promotion_installation_cost + promotion_assembling_fee
  end

  protected
    def promotion_content(method)
      OnlinePromotion.promotion_content(order.online_promotions.product_promotions,
                                        order.online_promotions.order_promotions, method, :sku => sku,
                                        :user => order.user, :site => "admin_order", :order => order, :order_channel => 2)
    end
end
