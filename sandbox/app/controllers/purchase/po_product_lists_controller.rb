class Purchase::PoProductListsController < ApplicationController
  before_filter :authenticate_administrator!

  def create
    @purchase_order = PurchaseOrder.find(params[:purchase_order_id])
    @po_product_list = @purchase_order.add_po_product(params[:product_id])
    @po_product_list.save
    render "operating"
  end

  def update
    @po_product_list = PoProductList.find(params[:id])
    @po_product_list.update_attribute(:product_purchase_amount, params[:product_purchase_amount])
    @purchase_order = PurchaseOrder.find(@po_product_list.purchase_order_id)
    render "operating"
  end

  def destroy
    @po_product_list = PoProductList.find(params[:id])
    @po_product_list.destroy
    @purchase_order = PurchaseOrder.find(@po_product_list.purchase_order_id)
    render "operating"
  end

  def released_update
    @po_product_list = PoProductList.find(params[:id])
    if params[:product_purchase_amount].to_i >= @po_product_list.store_amount
      @po_product_list.update_attribute(:product_purchase_amount, params[:product_purchase_amount])
    end
    @purchase_order = PurchaseOrder.find(@po_product_list.purchase_order_id)
  end

end
