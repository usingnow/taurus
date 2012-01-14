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
end
