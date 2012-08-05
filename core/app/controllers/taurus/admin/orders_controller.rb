module Taurus
	module Admin
		class OrdersController < BaseController
			helper "taurus/orders"

		  def index
		  	@search = Order.search(params[:q])
		  	@search.sorts = "updated_at desc"
		  	@orders = @search.result.processing.paginate(:page => params[:page], :per_page => 20)
		  end

		  def all
        @search = Order.search(params[:q])
		  	@search.sorts = "updated_at desc"
		  	@orders = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end

		  def show
        @order = Order.find(params[:id])
		  end

      def edit
        @order = Order.find(params[:id])
      end

      def update
        @order = Order.find(params[:id])

        if @order.update_attributes(params[:order])
        	flash[:success] = I18n.t('successfully_updated')
        	redirect_to(edit_admin_order_url(@order))
        else
        	render :action => :edit
        end
      end

		  def relieve_reserved
        @order = Order.find(params[:id])
        @order.relieve_reserved
        redirect_to(:back)
		  end

		  def confirm_online_payment
        @order = Order.find(params[:id])
        alipay_trade_no = @order.order_payment.alipay_trade_no
        alipay_buyer_email = @order.order_payment.alipay_buyer_email

        if alipay_trade_no && alipay_buyer_email
          @order.confirm_online_payment unless alipay_trade_no.blank? && alipay_buyer_email.blank?
        else
          flash[:error] = I18n.t('admin.misc.order.confirm_online_payment_errors')
        end
        redirect_to(:back)
		  end

		  def sign
        @order = Order.find(params[:id])
        if @order.order_payment.payment_method_id == 1
          flash[:success] = I18n.t('admin.misc.order.completed') if @order.sign
          redirect_to(:back)
        else
          @order.order_payment.delivery_payment_type = 0
          render :action => :delivery_confirm_sign
        end
      end
      
      def delivery_sign
        @order = Order.find(params[:id])

        if @order.update_attributes(params[:order])
          flash[:success] = I18n.t('admin.misc.order.completed') if @order.sign
        end

        redirect_to(admin_orders_url)
      end

      def cancel
        @order = Order.find(params[:id])
        @order.cancel
        redirect_to(:back)
      end
		end
	end	
end		
