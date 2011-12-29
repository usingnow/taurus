class ApplicationController < ActionController::Base
  protect_from_forgery

  def paginate(scoped,page,per_page)
     page||=1
     per_page||=10
     [scoped.offset((page.to_i-1)*per_page.to_i).limit(per_page),scoped.count]
  end

  private
    #获得购物车
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart =  Cart.create
      session[:cart_id] = cart.id
      cart
    end

    #获得最前流程
    def current_procedure(id)
      if id != nil
        Procedure.find(id)
      else
        procedures = Procedure.find_all_by_active(true)
        procedures[0]
      end
    end

    #获得订单编号
    def current_number
      date = ::Time.zone ? ::Time.zone.today : ::Date.today
      order_number = OrderNumber.find_last_by_date(date)
      if order_number == nil
        order_number = OrderNumber.create(:date=>date,:seq=>"1")
      else
        order_number.update_attributes(:seq=>order_number.seq+1)
      end

      seq = order_number.seq.to_s
      if seq.length == 1
        seq = '000'+seq
      elsif seq.length == 2
        seq = '00'+seq
      elsif seq.length == 3
        seq = '0'+seq
      end

      order_number.date.to_s(:number)+'_'+seq
    end

    def current_serial_number(value)
      date = Time.now.strftime('%Y%d').to_s[2,4]

      serial_number = SerialNumber.find_by_name_and_date(value,date)
      if serial_number.nil?
        serial_number = SerialNumber.create(:name=>value, :date=>date, :sequence=>1)
      else
        serial_number.update_attributes(:sequence=>serial_number.sequence)
      end

      seq = serial_number.sequence.to_s
      if seq.length == 1
        seq = '00000'+seq
      elsif seq.length == 2
        seq = '0000'+seq
      elsif seq.length == 3
        seq = '000'+seq
      elsif seq.length == 4
        seq = '00'+seq
      elsif seq.length == 5
        seq = '0'+seq
      end

      serial_number.name+serial_number.date.to_s+seq
    end
end
