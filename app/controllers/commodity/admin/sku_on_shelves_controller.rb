class Commodity::Admin::SkuOnShelvesController < ApplicationController
  def index
    @sku = Sku.find(params[:sku_id])
  end

  def new
    @sku = Sku.find(params[:sku_id])

    @sku_on_shelf = @sku.sku_on_shelves.build

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