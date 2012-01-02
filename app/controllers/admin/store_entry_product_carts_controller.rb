class Admin::StoreEntryProductCartsController < ApplicationController
  def create
    product_id = params[:product_id]
    admin_id = current_administrator.id
    @store_entry_product_cart = StoreEntryProductCart.find_by_product_id(product_id)

    if @store_entry_product_cart
      @store_entry_product_cart.quantity += 1
    else
      @store_entry_product_cart = StoreEntryProductCart.new(:product_id=>product_id,
                                                            :admin_id=>admin_id,
                                                            :quantity => 1,
                                                            :delivery_date => "2010-11-11")
    end

    @store_entry_product_cart.save

    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id(admin_id)

    render :partial => "products"
  end

  def update
    @store_entry_product_cart = StoreEntryProductCart.find(params[:id])

    if params[:type] == "1"
      @store_entry_product_cart.update_attributes(:quantity => params[:value])
    else
      @store_entry_product_cart.update_attributes(:delivery_date => params[:value])
    end
  end
end