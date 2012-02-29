#encoding:UTF-8
class Cart < ActiveRecord::Base
  has_many :cart_skuships, :dependent => :destroy
  has_many :skus, :through => :cart_skuships

  def add_sku(sku_id,quantity)
    current_cart_sku = cart_skuships.find_by_sku_id(sku_id)
    if current_cart_sku
     current_cart_sku.quantity += quantity.to_i
    else
      current_cart_sku = cart_skuships.build(:sku_id => sku_id, :is_need_install => 0, :is_need_assemble => 0)
    end
    current_cart_sku
  end


  def total_items
    cart_skuships.sum(:quantity)
  end

  def total_sku_amount
    cart_skuships.where("sku_id in (select id from skus where sku_type !=2)").to_a.sum do |cart_sku|
      cart_sku.quantity * cart_sku.sku.cost_aft_tax
    end
  end

  def total_installation_amount
    cart_skuships.where("is_need_install = 1 and sku_id in (select id from skus where sku_type !=2)").to_a.sum do |cart_sku|
      cart_sku.sku.installation_cost_aft_tax
    end
  end

  def total_assembling_amount
    cart_skuships.where("is_need_assemble = 1 and sku_id in (select id from skus where sku_type !=2)").to_a.sum do |cart_sku|
      cart_sku.sku.assembling_fee_aft_tax
    end
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
end
