class Order < ActiveRecord::Base
  has_many :order_details, :dependent => :destroy
  belongs_to :instance, :dependent => :destroy
  belongs_to :user
  belongs_to :admin, :class_name => "Admin", :foreign_key => "take_admin_id"
  belongs_to :make_admin, :class_name => "Admin", :foreign_key => "created_admin_id"

  def add_cart_skuships_from_cart(cart)
    cart.cart_skuships.each do |sku|
      sku.cart_id = nil
      cart_skuships << sku
    end
  end

  def total_skus
    order_details.sum(:quantity)
  end

  def total_details
    order_details.size
  end

  def next_action
    instance.procedure.station_procedureships.find_all{|s| s.station_id == instance.station_id && s.condition.condition_type == 1}
  end

end
