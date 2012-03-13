class Purchase::PoProductTempListsController < ApplicationController
  def create
    @cart = current_cart
    @po_product_temp_list = @cart.add_po_product(params[:product_id])
    @po_product_temp_list.save
    render "operating"
  end

  def destroy
    @po_product_temp_list = PoProductTempList.find(params[:id])
    @po_product_temp_list.destroy
    @cart = current_cart
    render "operating"
  end

  def update
    @po_product_temp_list = PoProductTempList.find(params[:id])
    @po_product_temp_list.update_attribute(:product_purchase_amount, params[:product_purchase_amount])
    @cart = current_cart
    render "operating"
  end
end