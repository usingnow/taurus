#encoding:UTF-8
class User::Index::FavoritesController < ApplicationController
  def create
    if current_user.nil?
      render :json => "请先登录！".to_json
    else
      @favorite = current_user.favorites.find_by_sku_id(params[:sku_id])
      if @favorite
        render :json => "您选择的商品已经添加过关注！".to_json
      else
        @favorite = current_user.favorites.build(:sku_id => params[:sku_id])
        if @favorite.save
          render :json => "您选择的商品成功添加关注！".to_json
        else
          render :json => "关注失败！".to_json
        end
      end
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
    redirect_to my_favorites_user_user_centers_path
  end
end