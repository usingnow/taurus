#encoding:UTF-8
class AlipaiesController < ApplicationController
  def index
    @order = Order.find_by_number(params[:number])
    parameters = {
      'service' => 'create_direct_pay_by_user',
      'partner' => '2088401060319138',
      'seller_email' => "pay@emehome.cn",
      'out_trade_no' => @order.number,
      'subject' => '在线支付',
      'body' => '壹美壹家订单在线支付',
      'price' => @order.total_amount.to_s,
      'quantity'=> 1.to_s,
      'payment_type' => '1',
      '_input_charset'=> 'utf-8',
      'notify_url' => url_for(:only_path => false, :action => 'notify'),
      'return_url'=> url_for(:only_path => false, :action => 'done')
    }
    # 即时到帐中交易状态为“等待买家付款”的状态默认是不会发送通知的，自己手动设置一下


    values = {}
    # 支付宝要求传递的参数必须要按照首字母的顺序传递，所以这里要sort
    parameters.keys.sort.each do |k|
      values[k] = parameters[k]
    end

    # 一定要先unescape后再生成sign，否则支付宝会报ILLEGAL SIGN
    sign = Digest::MD5.hexdigest(CGI.unescape(values.to_query) + "tyyq0r9bmoerl5e89k3v4megsufqkujm")
    gateway = 'https://www.alipay.com/cooperate/gateway.do?'
    redirect_to gateway + values.to_query + '&sign=' + sign + '&sign_type=MD5'
  end
    # 返回success或fail。如果返回fail，支付宝会每隔一段时间就自动调用notify_url通信接口

  def notify
    render :text => '成功'
  end

  def done
    order = Order.find_by_number(params[:out_trade_no])
    # 支付宝即时到帐接口只有一种交易状态，就是“交易成功”，更新一下
    status = params[:trade_status]
    if status == "TRADE_SUCCESS"
      @order_pay = order.build_order_pay(:procedure_id => order.instance.procedure_id, :buyer_alipay_no => params[:buyer_id],
                     :alipay_date => params[:notify_time], :alipay_no => params[:trade_no], :alipay_price => params[:total_fee],
                     :province_no => order.district.city.province_no, :status => 2)
      @order_pay.save

      station_procedureship = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(
                                order.instance.procedure_id, order.instance.station_id, 30)


      #保存过站记录
      hash = [{:instance_id => order.instance.id, :station_id => order.instance.station_id,
               :condition_id => 30, :next_station_id => station_procedureship.next_station_id,
               :created_by => "前台客户"}]
      save_station_track(hash)

      order.instance.update_attributes(:station_id => station_procedureship.next_station_id)

      redirect_to user_user_centers_path
    else
      render :text => "支付失败"
    end
  end

end