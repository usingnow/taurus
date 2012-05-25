module Taurus
  module Admin
    class ReplenishmentRecordsController < BaseController
      autocomplete :supplier, :name, :class_name => "Taurus::Supplier"
      autocomplete :sku, :name, :class_name => "Taurus::Sku", :extra_data => [:number]

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

        params[:sku_amount].each do |key,value|
          @replenishment_record.replenishment_record_sku_line_items << ReplenishmentRecordSkuLineItem.new(
            :sku_id => key, :sku_amount => value
          ) 
        end if params[:sku_amount]

        if @replenishment_record.save
          redirect_to(admin_replenishment_records_url)
        else
          render :action => :new
        end
      end
    end
  end
end