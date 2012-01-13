class Admin::SliderBarsController < ApplicationController
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

    respond_to do |format|
      if @slider_bar.save
        format.html { redirect_to([:admin,@slider_bar], :notice => 'Pick up was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @slider_bar = SliderBar.find(params[:id])

    respond_to do |format|
      if @slider_bar.update_attributes(params[:slider_bar])
        format.html { redirect_to([:admin,@slider_bar], :notice => 'Pick up was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slider_bar.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @slider_bar = SliderBar.find(params[:id])
    @slider_bar.destroy

    respond_to do |format|
      format.html { redirect_to(admin_slider_bars_url) }
      format.xml  { head :ok }
    end
  end
end