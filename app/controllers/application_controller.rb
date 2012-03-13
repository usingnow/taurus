#encoding:UTF-8
class ApplicationController < ActionController::Base

  private

    def current_ability
      @current_ability ||= Ability.new(current_administrator)
    end

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
    def current_order_number
      date = ::Time.zone ? ::Time.zone.today : ::Date.today
      order_number = OrderNumber.find_last_by_date(date)
      if order_number == nil
        order_number = OrderNumber.create(:date=>date,:seq=>"1")
      else
        order_number.update_attributes(:seq=>order_number.seq+1)
      end

      seq = order_number.seq.to_s.rjust(4,"0")

      order_number.date.to_s(:number)+'_'+seq
    end

    def current_serial_number(value)
      date = Time.now.strftime('%Y%m%d').to_s

      serial_number = SerialNumber.find_by_name_and_date(value,date)
      if serial_number.nil?
        serial_number = SerialNumber.create(:name=>value, :date=>date, :sequence=>1)
      else
        serial_number.update_attributes(:sequence=>serial_number.sequence+1)
      end

      seq = serial_number.sequence.to_s.rjust(6,"0")


      serial_number.name+serial_number.date.to_s+seq
    end

    def set_store_to_product(product,store_ids)
      line_items = []

      store_ids.each do |id|
        product_storeship = ProductStoreship.find_by_product_id_and_store_id(product.id,id)
        if product_storeship.nil?
          line_items<<{:store_id=>id,:product_id=>product.id,:quantity=>0,:stockout=>0}
        else
          line_items<<{:store_id=>id,:product_id=>product.id,:quantity=>product_storeship.quantity,:stockout=>product_storeship.stockout}
        end
      end

      ProductStoreship.destroy_all(:product_id=>product.id)
      ProductStoreship.create(line_items)
    end

    #删除 入库单商品购物车 的 此用户 所有商品
    def destroy_sepc_by_admin_id(admin_id,type)
      StoreEntryProductCart.destroy_all(:admin_id => admin_id,:cart_type => type)
    end

    #入库增加库存
    def change_store_quantity(line_items,store_id)
      line_items.each do |item|
        @product_storeship = ProductStoreship.find_by_product_id_and_store_id(item.product_id,store_id)
        if item.quantity > @product_storeship.stockout
          @product_storeship.update_attributes(:quantity => item.quantity-@product_storeship.stockout+@product_storeship.quantity,
                                               :stockout => 0)
        else
          @product_storeship.update_attributes(:quantity => 0,
                                               :stockout => @product_storeship.stockout-item.quantity)
        end
      end
    end

    #出库减库存
    def subtract_store_quantity(line_items,delivery_order)
      line_items.each do |item|
        @product_storeship = ProductStoreship.find_by_product_id_and_store_id(item.product_id,delivery_order.store_id)
        if delivery_order.order_id.nil?
          if item.quantity < @product_storeship.quantity
          @product_storeship.update_attributes(:quantity => @product_storeship.quantity-item.quantity,
                                               :stockout => 0)
          else
            @product_storeship.update_attributes(:quantity => 0,
                                                 :stockout => item.quantity-@product_storeship.quantity+@product_storeship.stockout)
          end
        else
          if item.quantity < @product_storeship.sales_reserved
            if item.quantity < @product_storeship.quantity
              @product_storeship.update_attributes(:quantity => @product_storeship.quantity-item.quantity,
                                                   :stockout => 0,
                                                   :sales_reserved => @product_storeship.sales_reserved-item.quantity)
            else
              @product_storeship.update_attributes(:quantity => 0,
                                                   :stockout => item.quantity-@product_storeship.quantity+@product_storeship.stockout,
                                                   :sales_reserved => @product_storeship.sales_reserved-item.quantity)
            end
          else
            if item.quantity < @product_storeship.quantity
              @product_storeship.update_attributes(:quantity => @product_storeship.quantity-item.quantity,
                                                   :stockout => 0,
                                                   :sales_reserved => 0)
            else
              @product_storeship.update_attributes(:quantity => 0,
                                                   :stockout => item.quantity-@product_storeship.quantity+@product_storeship.stockout,
                                                   :sales_reserved => 0)
            end
          end
        end
      end
    end

    #获得订单实例
    def current_instance(procedure_id,next_station_id)
      Instance.create(:procedure_id=>procedure_id,:station_id=>next_station_id)
    end

    #批量添加订单详情
    def create_order_details(inner_sku_carts,order_id)
      line_items = []
      inner_sku_carts.each do |cart|
        line_items << {:order_id => order_id, :sku_id => cart.sku_id, :unit_price => cart.sku.cost_aft_tax,
                       :quantity => cart.quantity}
      end
      OrderDetail.create(line_items)
    end

    #保存过站记录
    def save_station_track(hash)
      Track.create(hash)
    end

    #保存接管记录
    def save_take_log(hash)
      OrderTakeLog.create(hash)
    end

    #保存支付宝支付信息
    def save_order_pay(hash)
      @order_pay = OrderPay.new(hash)
      @order_pay.save
      @order_pay
    end

    def current_person_no
      number = UserNumber.last
      number.person_no += 1
      number.save
      "P" + number.person_no.to_s.rjust(6,"0")
    end

    def current_company_no
      number = UserNumber.last
      number.company_no += 1
      number.save
      "U" + number.company_no.to_s.rjust(6,"0")
    end

    def is_have_store(order,store_id)
      flag = true
      order.order_details.each do |detail|
        detail.sku.products.each do |product|
          product_storeship =  ProductStoreship.find_by_product_id_and_store_id(product.id,store_id)
          if product_storeship.nil?
            flag = false
            break
          end
        end
      end
      flag
    end

    #订单过站
    def order_cross_station(object,options={})
      instance = object.instance
      station_procedureship = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(
                                instance.procedure_id, instance.station_id, options[:condition_id])


      #保存过站记录
      hash = [{:instance_id => instance.id, :station_id => instance.station_id,
               :condition_id => options[:condition_id], :next_station_id => station_procedureship.next_station_id,
               :created_by => "前台客户"}]
      save_station_track(hash)

      instance.update_attributes(:station_id => station_procedureship.next_station_id)
    end

    def current_number(name)
      number_counter = NumberCounter.current_number(name)
      if number_counter.save
        number_counter.name + number_counter.date.to_s + number_counter.sequence.to_s.rjust(3,"0")
      else
        "未知错误"
      end
    end
end
