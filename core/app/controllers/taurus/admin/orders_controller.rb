#encoding:UTF-8
module Taurus
  module Admin
    class OrdersController < BaseController
      helper "taurus/orders"

      def index
        @search = Order.search(params[:q])
        @search.sorts = "updated_at desc"
        @orders = @search.result.processing.paginate(:page => params[:page], :per_page => 20)
        @states = Hash[Order::STATE]
        @states.delete("completed")
        @states.delete("canceled")
        @states.delete("start")
        @states.delete("reserved")
      end

      def all
        @search = Order.search(params[:q])
        @search.sorts = "updated_at desc"
        @orders = @search.result.paginate(:page => params[:page], :per_page => 20)
        @states = Hash[Order::STATE]
        @states.delete("start")
        @states.delete("reserved")
      end

      def show
        @order = Order.find(params[:id])
      end

      def new
        @order = Order.new
        @order.order_delivery = OrderDelivery.new
        @order.order_payment = OrderPayment.new

        session[:order_step] = nil
        session[:order_params] ||= {}
      end

      def create
        session[:order_params].deep_merge!(params[:order]) if params[:order]

        @order = Order.new(session[:order_params])

        @shipping_cost = ShippingCost.first || ShippingCost.create
        
        total_payment = @shipping_cost.cost

        session[:amount] = params[:amount] if params[:amount]

        session[:amount].each do |key, value|
          current_product = Product.find(key)
          
          @order.order_product_line_items << OrderProductLineItem.new(
            :product_id => key, :product_amount => value,
            :unit_price => current_product.price_after_tax
          )

          total_payment += current_product.price_after_tax * value.to_i
        end

        @order.total_payment = total_payment
        @order.order_delivery.shipping_standard_cost = @shipping_cost.cost
        @order.order_delivery.shipping_cost = @shipping_cost.cost

        @order.current_step = session[:order_step]

        if @order.valid?  
          if params[:back_button]  
            @order.current_step = "new"  
          elsif params[:commit_button]  
            @order.save  
          elsif params[:preview_button]  
            @order.current_step = "preview"  
          end  
          session[:order_step] = @order.current_step  
        end 

        if @order.new_record?  
          render 'new'  
        else  
          session[:order_step] = session[:order_params] = session[:amount] = nil  
          flash[:success] = I18n.t('successfully_created')
          redirect_to admin_order_url(@order)  
        end
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
        @order_payment = @order.order_payment

        @order_payment.alipay_trade_no = params[:alipay_trade_no]
        @order_payment.alipay_buyer_email = params[:alipay_buyer_email]
        @order_payment.save

        @order.confirm_online_payment
        
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

      def autocomplete_user_name
        @search = User.search({:'userable_of_Taurus::PersonExtend_type_name_or_userable_of_Taurus::CompanyExtend_type_name_cont' => params[:term]})
        @users = @search.result
        render :json => json_for_autocomplete(@users, :name)
      end

      def autocomplete_product_name
        @search = Product.shown.displays.search({:'name_cont' => params[:term]})
        @products = @search.result
        render :json => json_for_autocomplete(@products, :name, [:number, :price_after_tax])
      end
    end
  end  
end    