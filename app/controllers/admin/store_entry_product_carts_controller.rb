class Admin::StoreEntryProductCartsController < ApplicationController
  def create
    product_id = params[:product_id]
    admin_id = current_administrator.id
    cart_type = params[:cart_type] # 判断是采购单还是入库单
    @store_entry_product_cart = StoreEntryProductCart.find_by_product_id_and_admin_id_and_cart_type(product_id,admin_id,cart_type)

    if @store_entry_product_cart
      @store_entry_product_cart.quantity += 1
    else
      @store_entry_product_cart = StoreEntryProductCart.new(:product_id=>product_id,
                                                            :admin_id=>admin_id,
                                                            :quantity => 1,
                                                            :delivery_date => "2010-11-11",
                                                            :cart_type=>cart_type)
    end

    @store_entry_product_cart.save

    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,cart_type)

    render :partial => "products"
  end

  def update
    @store_entry_product_cart = StoreEntryProductCart.find(params[:id])

    if params[:type] == "1"
      @store_entry_product_cart.update_attributes(:quantity => params[:value])
    elsif params[:type] == "2"
      @store_entry_product_cart.update_attributes(:delivery_date => params[:value])
    elsif params[:type] == "3"
      @store_entry_product_cart.update_attributes(:unit_price_aft_tax => params[:value])
    elsif params[:type] == "4"
      @store_entry_product_cart.update_attributes(:total_amount => params[:value])
    end
  end

  def destroy
    @store_entry_product_cart = StoreEntryProductCart.find(params[:id])
    @store_entry_product_cart.destroy

    admin_id = current_administrator.id
    cart_type = params[:cart_type] # 判断是采购单还是入库单

    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,cart_type)

    render :partial => "products"
  end
end