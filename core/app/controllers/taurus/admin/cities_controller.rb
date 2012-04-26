class Admin::CitiesController < ApplicationController
  def ajax
    if params[:province_no] != ""
      @cities = City.find_all_by_province_no(params[:province_no])
    else
      @cities = []
    end
      render :partial => "cities"
  end
end