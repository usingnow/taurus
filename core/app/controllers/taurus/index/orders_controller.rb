#encoding:UTF-8
module Taurus
	module Index
		class OrdersController < Taurus::Index::BaseController
      before_filter :authenticate_user!
      helper "taurus/orders"

      def show
        @order = current_user.orders.find(params[:id])
      end

			def new
        @cart = current_cart

        if @cart.cart_product_line_items.empty?
          flash[:error] = '必须包含一件以上商品'
          redirect_to(index_cart_product_line_items_url)
        else
          session[:order_step] = nil
          session[:order_params] ||= {}
          @order = Order.new
          @order.order_delivery = OrderDelivery.new
          @order.order_payment = OrderPayment.new
        end
			end

			def create
        session[:order_params].deep_merge!(params[:order]) if params[:order]
        @cart = current_cart
        @order = Order.new(session[:order_params])
        @order.user_id = current_user.id
        @order.customer_name = current_user.userable.name  
        @order.total_payment = @cart.total_price
        @cart.cart_product_line_items.each do |line_item|
          @order.order_product_line_items << OrderProductLineItem.new(
            :product_id => line_item.product_id, :product_amount => line_item.product_amount, 
            :unit_price => line_item.product.price_after_tax
          )
        end
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
          @cart.destroy
          session[:order_step] = session[:order_params] = session[:cart_id] = nil  
          redirect_to success_index_order_url(@order)  
        end
			end

      def success
        @order = current_user.orders.find(params[:id])
      end

      def online_payment
        @alipay = Alipay.first

        if @alipay
          @order = current_user.orders.find(params[:id])

          parameters = @alipay.parameters(@order, online_payment_notify_index_orders_url,
                                          online_payment_done_index_orders_url)

          sign = Digest::MD5.hexdigest(CGI.unescape(parameters.to_query) + 
                 "tyyq0r9bmoerl5e89k3v4megsufqkujm")
          gateway = 'https://www.alipay.com/cooperate/gateway.do?'
          redirect_to gateway + parameters.to_query + '&sign=' + sign + '&sign_type=MD5'
        else
          redirect_to :back
        end
      end

      def online_payment_notify
        @order = current_user.orders.find_by_number(params[:out_trade_no])
        @order.order_payment.update_attributes(:alipay_trade_no => params[:trade_no],
                                               :alipay_buyer_email => params[:buyer_email])

        render :text => '成功'
      end

      def online_payment_done
        @order = current_user.orders.find_by_number(params[:out_trade_no])
        
        if params[:trade_status] == "TRADE_SUCCESS"
          @order.online_payment
          
          redirect_to index_user_centers_path
        else
          render :text => "支付失败"
        end
      end

      def cancel
        @order = Order.find(params[:id])
        @order.cancel
        redirect_to(:back)
      end
        
		end
	end
end