class Commodity::Admin::SkuOnShelvesController < ApplicationController
  def index
    @sku = Sku.find(params[:sku_id])
  end

  def new
    @sku = Sku.find(params[:sku_id])

    @sku_on_shelf = @sku.sku_on_shelves.build

  end

  def create
    @sku = Sku.find(params[:sku_id])
    @sku_on_shelf = @sku.sku_on_shelves.build(params[:sku_on_shelf])
    @sku_on_shelf.status = 2
    if @sku_on_shelf.save
      redirect_to commodity_admin_sku_sku_on_shelves_url(@sku)
    else
      render "new"
    end
  end

  def update
    @sku_on_shelf = SkuOnShelf.find(params[:id])

    @sku_on_shelf.update_attributes(:status => params[:status])

    redirect_to commodity_admin_sku_sku_on_shelves_url(params[:sku_id])
  end

  def destroy
    @sku_on_shelf = SkuOnShelf.find(params[:id])

    @sku_on_shelf.destroy

    redirect_to commodity_admin_sku_sku_on_shelves_url(params[:sku_id])
  end
end