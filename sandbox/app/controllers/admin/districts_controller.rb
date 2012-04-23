class Admin::DistrictsController < ApplicationController
  def ajax
    if params[:city_no] != ""
      @districts = District.find_all_by_city_no(params[:city_no])
    else
      @districts = []
    end
      render :partial => "districts"
  end
end