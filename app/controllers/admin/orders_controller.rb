#encoding:UTF-8
class Admin::OrdersController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  def index
    q = {"instance_station_station_type_in" => ['0','3','4']}.merge(params[:q] || {}).merge(order_search)
    @search = Order.search(q)
    sort = params[:sort] ||= "desc"
    @search.sorts = "created_at #{sort}"
    @orders = @search.result.paginate(:page => params[:page],:per_page => 15)
  end


  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @date = Time.now.strftime('%Y-%m-%d')
    @user = User.new
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
    @search = Sku.search(params[:q])
  end



  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(session[:order_id])

    Order.transaction do
      if !@order.update_attributes(params[:order])
        @search = Sku.search(params[:q])
        render "edit"
        return
      end


      @instance = Instance.find(@order.instance_id)
      @station_procedureship = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,
                                                                                                         @instance.station_id,
                                                                                                         session[:condition_id])

      #保存过站记录
      hash = [{:instance_id => @instance.id, :station_id => @instance.station_id,
               :condition_id => session[:condition_id], :next_station_id => @station_procedureship.next_station_id,
               :created_by => current_administrator.name}]
      save_station_track(hash)

      #执行业务函数
      if !@station_procedureship.business_function_id.nil?
        if @station_procedureship.business_function.function == "delivery"
          @order.update_attributes(:is_delivery => 1)
        end
      end

      station_id = @station_procedureship.next_station_id
      if @station_procedureship.next_station_id == 4
        retention_flag = 0
        reserve_reason = nil
        @order.order_details.each do |detail|
          if detail.sku.sku_type == 2
            retention_flag = 1
            reserve_reason = "非在库品"
            break
          end
        end

        if retention_flag == 0
          @order.order_details.each do |detail|
            if detail.sku.nb_is_inventory == false
              retention_flag = 2
              reserve_reason = "[#{detail.sku.name}库存不足]"
              break
            end
          end
        end


        if retention_flag != 0
          condition = Condition.find_by_action("true")
          #获得保留单的下一站
          station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,4,condition.id)
          #保存过站记录
          hash = [{:instance_id => @instance.id, :station_id => 4,
                 :condition_id => condition.id, :next_station_id => station.next_station_id,
                 :created_by => current_administrator.name}]
          save_station_track(hash)
          station_id = station.next_station_id
          @order.update_attributes(:reserve_reason => reserve_reason)
        else
          condition = Condition.find_by_action("false")
          #获得保留单的下一站
          station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,4,condition.id)
          station_id = station.next_station_id
        end
      end

      if @instance.update_attributes(:station_id=>station_id)
         session[:order_id] = nil
         session[:condition_id] = nil
         redirect_to(admin_orders_url)
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(admin_orders_url) }
      format.xml  { head :ok }
    end
  end

  #订单接管与取消
  def take_over
    @order = Order.find(params[:id])
    admin = current_administrator

    if params[:type] == "0"
      @order.update_attributes(:take_admin_id=>nil)
    else
      @order.update_attributes(:take_admin_id=>admin.id)
    end


    hash = [{:order_id => params[:id], :oper_type => params[:type], :created_by => admin.name,
             :administrator_id => admin.id}]
    save_take_log(hash)


    respond_to do |format|
      format.html { redirect_to(admin_orders_url) }
      format.xml  { head :ok }
    end
  end

  def cancel
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  def condition
    @order = Order.find(session[:order_id])

    Order.transaction do
      if !@order.update_attributes(params[:order])
        render "cancel"
        return
      end

      if !params[:order].nil?
        if !params[:order][:store_id].nil?
          if !is_have_store(@order,params[:order][:store_id])
            @order.errors.add("选择的仓库","无此货物")
            render "output"
            return
          end
        end
      end


      #保存支付宝支付信息
      if !params[:order_pay].nil?
        hash = {"order_id" => @order.id, "alipay_price_confirmation" => @order.promotion_price, "price_confirmation" => @order.promotion_price}.merge(params[:order_pay] || {})
        @order_pay = save_order_pay(hash)
        if @order_pay.errors.size > 0
          if params[:order_pay][:condition_type] == "1"
            render "paid"
          elsif params[:order_pay][:condition_type] == "2"
            render "input_pay_info"
          end
          return
        end
      end

      @instance = Instance.find(@order.instance_id)
      @station_procedureship = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,
                                                                                                         @instance.station_id,
                                                                                                         session[:condition_id])

      #保存过站记录
      hash = [{:instance_id => @instance.id, :station_id => @instance.station_id,
               :condition_id => session[:condition_id], :next_station_id => @station_procedureship.next_station_id,
               :created_by => current_administrator.name}]
      save_station_track(hash)

      #执行业务函数
      if !@station_procedureship.business_function_id.nil?
        if @station_procedureship.business_function.function == "delivery"
          @order.update_attributes(:is_delivery => 1)
        end
      end

      station_id = @station_procedureship.next_station_id
      if @station_procedureship.next_station_id == 4
        retention_flag = 0
        reserve_reason = nil
        @order.order_details.each do |detail|
          if detail.sku.sku_type == 2
            retention_flag = 1
            reserve_reason = "非在库品"
            break
          end
        end

        if retention_flag == 0
          @order.order_details.each do |detail|
            if detail.sku.nb_is_inventory == false
              retention_flag = 2
              reserve_reason = "[#{detail.sku.name}库存不足]"
              break
            end
          end
        end


        if retention_flag != 0
          condition = Condition.find_by_action("true")
          #获得保留单的下一站
          station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,4,condition.id)
          #保存过站记录
          hash = [{:instance_id => @instance.id, :station_id => 4,
                 :condition_id => condition.id, :next_station_id => station.next_station_id,
                 :created_by => current_administrator.name}]
          save_station_track(hash)
          station_id = station.next_station_id
          @order.update_attributes(:reserve_reason => reserve_reason)
        else
          condition = Condition.find_by_action("false")
          #获得保留单的下一站
          station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,4,condition.id)
          station_id = station.next_station_id
        end
      end

      if @instance.update_attributes(:station_id=>station_id)
         session[:order_id] = nil
         session[:condition_id] = nil
         redirect_to(admin_orders_url)
      end
    end
  end

  def paid
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
    @order_pay = OrderPay.new
  end

  def output
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  def sign_in
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  def input_pay_info
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
    @order_pay = OrderPay.new
  end

  def pay_confirmation
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  #所有字段订单搜索
  def all
    @search = Order.search(order_search.merge(params[:q] || {}))
    sort = params[:sort] ||= "desc"
    @search.sorts = "created_at #{sort}"
    @orders = @search.result.paginate(:page => params[:page],:per_page => 15)
  end


  def relieve_retention
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  #打印送货单
  def print_delivery_note
    @search = Order.search(order_search.merge(params[:q] || {}))
    sort = params[:sort] ||= "desc"
    @search.sorts = "created_at #{sort}"
    @orders = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def show_delivery_note
    @order = Order.find(params[:id])
    pdf = Prawn::Document.new(:page_size => [630,397])
    pdf.font "#{::Prawn::BASEDIR}/data/fonts/SimHei.ttf"

    page = @order.order_details.size > 6 ? (@order.order_details.size-7)/10+2 : 1

    page.times.each do |p|
      pdf.draw_text "壹美壹家送货单", :size => 20, :at => [220,330]
      pdf.image "app/assets/images/printLogo.jpg",:width => 40, :height => 40, :at => [0,350]
      pdf.draw_text "轻松办公    快乐生活", :size => 10, :at => [50,316]

      pdf.move_down 20
      pdf.table([["订单编号：", @order.number, "订单批次：", @order.batch, "下单时间：", @order.created_at.to_s],
                 ["订单类型：", Sku::SKU_TYPE[@order.order_details.last.sku.sku_type],
                  "客户：",@order.user.name]], :cell_style => {:size => 8, :border_width => 0},
                :column_widths => {1 => 150, 3 => 150})

      data = [["#","订购编号","商品名称","规格型号","单位","数量"]]
      i = 0
      @order.order_details.limit(p == 0 ? 6 : 10).offset(p == 0 ? 0 : (6+(p-1)*10)).each_with_index do |item,index|
        data << [p == 0 ? index+1 : index + 7 + (p - 1)*10,item.sku.number,item.sku.name,item.sku.specification+","+item.sku.model,item.sku.unit,item.quantity]
        i = index
      end
      if p == 0
        (5-i).times.each do
          data << ["","","","","",""]
        end
      else
        (9-i).times.each do
          data << ["","","","","",""]
        end
      end
      data << ["","","","合计金额",@order.total_amount.to_s,""]

      pdf.table(data,:cell_style => {:size => 8 }, :column_widths => [20,50,280,108,60,30])

      pdf.table([["收货人：", @order.name, "所属地区：", @order.district.address, "支付方式：", @order.instance.procedure.display_name],
                 ["固定电话：", @order.phone, "手机：",@order.mobile],
                 ["收货地址：", @order.address],
                 ["客户备注：", @order.customer_note]],
                :cell_style => {:size => 8, :border_width => 0}, :column_widths => {1 => 150, 3 => 150}) if p == 0

      pdf.bounding_box([0, 30], :width => 630, :height => 150) do
        pdf.table([[p == 0 ? "您对我们的物流服务：满意 □  一般 □  不满意 □" : "", "客户签字："]],
                  :cell_style => {:size => 8, :border_width => 0}, :column_widths => {0 => 350})

        pdf.table([["仓库确认：", "物流司机：", "出发时间：", "到达时间："]],
                  :cell_style => {:size => 8, :border_width => 0}, :column_widths => {0 => 135, 1 => 135, 2 => 135, 3 => 135}) if p == 0
      end


      pdf.bounding_box([0, 0], :width => 630, :height => 150) do

        pdf.table([["www.emehome.cn", "客服热线：400-630-5006", "宁波壹美壹家贸易有限公司", "页码：#{p+1}/#{page}"]],
                :cell_style => {:size => 8, :border_width => 0}, :column_widths => {0 => 135, 1 => 135, 2 => 135, 3 => 135})
      end

      pdf.start_new_page if (p+1) < page
    end



    number = @order.number
    FileUtils.makedirs "public/print_file/delivery/#{number}"

    pdf.render_file "public/print_file/delivery/#{number}/#{Time.now.strftime("%Y%m%d%H%M%S")}.pdf"
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end

  def take_over_logs
    @order = Order.find(params[:id])
  end

  def order_tracks
    @order = Order.find(params[:id])
  end

  private
    def order_search
      q = Hash.new
      if params[:query]
        unless params[:query][:sku_name].blank?
          order_ids = OrderDetail.find_by_sql("select order_id from order_details where sku_id in(select id from skus where name like '%#{params[:query][:sku_name]}%')").map(&:order_id)
          q = {"id_in" => order_ids.empty?? [0] : order_ids}.merge(q || {})
        end
        unless params[:query][:user_no].blank?
          user = params[:query][:user_no][0,1] == "P" ? PersonExtend.find_by_person_no(params[:query][:user_no]) : CompanyExtend.find_by_company_no(params[:query][:user_no])
          q = { "user_id_eq" =>  user ? user.user_id : 0 }.merge(q || {})
        end
        unless params[:query][:user_name].blank?
          user_ids = PersonExtend.where("name like ?", "%#{params[:query][:user_name]}%").map(&:user_id)
          user_ids += CompanyExtend.where("company_name like ?", "%#{params[:query][:user_name]}%").map(&:user_id)
          q = { "user_id_in" =>  user_ids.empty?? [0] : user_ids }.merge(q || {})
        end
        unless params[:query][:sku_no].blank?
          order_ids = OrderDetail.find_by_sql("select order_id from order_details where sku_id in(select id from skus where number = '#{params[:query][:sku_no]}')").map(&:order_id)
          q = {"id_in" => order_ids.empty?? [0] : order_ids }.merge(q || {})
        end
      end
      q
    end
end
