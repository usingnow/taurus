module Taurus
  module Admin
    class ReplenishmentRecordsController < BaseController
      autocomplete :supplier, :name, :class_name => "Taurus::Supplier"
      autocomplete :product, :name, :class_name => "Taurus::Product", :extra_data => [:number]

      def index
        @search = ReplenishmentRecord.search(params[:q])
        @replenishment_records = @search.result.paginate(:page => params[:page], :per_page => 20)
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