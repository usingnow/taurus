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


  validates_presence_of :sku_id, :cart_id
  validates_numericality_of :quantity, :only_integer => true, :greater_than => 0
end
