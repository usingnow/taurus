#encoding:UTF-8
class User::Index::SubscribesController < ApplicationController
  layout "home"

  def new
    @subscribe = Subscribe.new
  end

  def create
    @subscribe = Subscribe.new(params[:subscribe])

    if @subscribe.save
      redirect_to new_user_index_subscribe_path, :notice => "订阅成功"
    else
      render "new"
    end
  end
end