module Taurus
  module Admin
    class ReplenishmentRecordsController < BaseController
      helper "taurus/replenishment_records"
      autocomplete :product, :name, :class_name => "Taurus::Product", :extra_data => [:number], :scopes => [:single]

      def index
        @search = ReplenishmentRecord.search(params[:q])
        @search.sorts = "created_at DESC"
        @replenishment_records = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @replenishment_record = ReplenishmentRecord.find(params[:id])
      end

      def new
        @replenishment_record = ReplenishmentRecord.new
      end

      def create
        @replenishment_record = ReplenishmentRecord.new(params[:replenishment_record])
        @replenishment_record.administrator_id = current_administrator.id

        params[:product_amount].each do |key,value|
          @replenishment_record.replenishment_record_product_line_items << ReplenishmentRecordProductLineItem.new(
            :product_id => key, :product_amount => value
          ) 
        end if params[:product_amount]

        if @replenishment_record.save
          redirect_to(admin_replenishment_records_url)
        else
          render :action => :new
        end
      end
    end
  end
end