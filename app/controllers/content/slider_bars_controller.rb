class Content::SliderBarsController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @slider_bars = SliderBar.all
  end

  def show
    @slider_bar = SliderBar.find(params[:id])

  end

  def new
    @slider_bar = SliderBar.new

  end

  def edit
    @slider_bar = SliderBar.find(params[:id])
  end


  def create
    @slider_bar = SliderBar.new(params[:slider_bar])

    if @slider_bar.save
      redirect_to content_slider_bars_url
    else
      render "new"
    end
  end


  def update
    @slider_bar = SliderBar.find(params[:id])

    if @slider_bar.update_attributes(params[:slider_bar])
      redirect_to content_slider_bars_url
    else
      render "edit"
    end
  end


  def destroy
    @slider_bar = SliderBar.find(params[:id])
    @slider_bar.destroy
    redirect_to content_slider_bars_url
  end
end