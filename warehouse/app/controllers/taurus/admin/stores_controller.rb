module Taurus
  module Admin
    class StoresController < BaseController
      #before_filter :authenticate_administrator!
      #authorize_resource

      def index
        @search = Store.search(params[:q])
        @stores = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @store = Store.find(params[:id])
      end

      def new
        @store = Store.new
      end

      def edit
        @store = Store.find(params[:id])
      end

      def create
        @store = Store.new(params[:store])

        respond_to do |format|
          if @store.save
            format.html { redirect_to([:admin,@store], :notice => 'Store was successfully created.') }
            format.xml  { render :xml => @store, :status => :created, :location => @store }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
          end
        end
      end

      def update
        @store = Store.find(params[:id])

        respond_to do |format|
          if @store.update_attributes(params[:store])
            format.html { redirect_to([:admin,@store], :notice => 'Store was successfully updated.') }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
          end
        end
      end

      def destroy
        @store = Store.find(params[:id])
        @store.destroy
        redirect_to admin_stores_url
      end

    end
  end
end