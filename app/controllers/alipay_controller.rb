#encoding:UTF-8
class AlipayController < ApplicationController
  def index
    @order_pay = OrderPay.new
  end

  def create
    @order_pay = OrderPay.new(params[:order_pay])
    if @order_pay.valid?
       render :confirm
    else
      render :index
    end
  end

  def show

  end

  def place_order
      parameters = {
        'service' => 'create_direct_pay_by_user',
        'partner' => ALIPAY_ACCOUNT,
        'seller_email' => ALIPAY_EMAIL,
        'out_trade_no' => @order.out_trade_no,
        'subject' => 'payment subject',
        'body' => 'payment body',
        'price' => @order.price.to_s,
        'quantity'=> @order.quantity.to_s,
        'payment_type' => '1',
        '_input_charset'=> 'utf-8',
        'notify_url' => url_for(:only_path => false, :action => 'notify'),
        'return_url'=> url_for(:only_path => false, :action => 'done')
      }
      # 即时到帐中交易状态为“等待买家付款”的状态默认是不会发送通知的，自己手动设置一下
      @order.status = 'WAIT_BUYER_PAY'
      @order.user = current_user
      @order.save
      values = {}
      # 支付宝要求传递的参数必须要按照首字母的顺序传递，所以这里要sort
      parameters.keys.sort.each do |k|
        values[k] = parameters[k];
      end
      # 一定要先unescape后再生成sign，否则支付宝会报ILLEGAL SIGN
      sign = Digest::MD5.hexdigest(CGI.unescape(values.to_query) + ALIPAY_KEY)
      gateway = 'https://www.alipay.com/cooperate/gateway.do?'
      redirect_to gateway + values.to_query + '&amp;sign=' + sign + '&amp;sign_type=MD5'
    end
    # 返回success或fail。如果返回fail，支付宝会每隔一段时间就自动调用notify_url通信接口

    def notify
      render :text => 'success'
    end

    def done
      if verify_sign
        order = Order.find_by_out_trade_no(params[:out_trade_no])
        # 支付宝即时到帐接口只有一种交易状态，就是“交易成功”，更新一下
        order.update_attributes(params[:trade_status])
        render :text => 'Payment successful'
      else
        render :text => 'Alipay Error: ILLEGAL_SIGN'
      end
    end
  protected
    def verify_sign
      params.delete("sign_type")
      sign = params.delete("sign")
      values = {}
      params.keys.sort.each do |k|
        values[k] = params[k]
      end
      sign.downcase == Digest::MD5.hexdigest(CGI.unescape(values.to_query) + ALIPAY_KEY)
    end

end