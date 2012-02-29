class Content::Index::ImagesController < ApplicationController
  layout "home"

  def show
    @image = Image.find params[:id]
  end
end