class Admin::AdministratorGroupshipsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  def new
    @administrator_groupships = AdministratorGroupship.find_all_by_administrator_id(params[:id])
    @administrator_groupship = AdministratorGroupship.new :administrator_id => params[:id]
  end

  def create
    group_ids = params[:group_id]

    AdministratorGroupship.destroy_all(:administrator_id=>params[:administrator_id])

    line_items = []
    group_ids.each do |group_id|
      line_items << {:administrator_id => params[:administrator_id], :group_id => group_id}
    end
    AdministratorGroupship.create(line_items)

    redirect_to admin_administrators_url
  end
end
