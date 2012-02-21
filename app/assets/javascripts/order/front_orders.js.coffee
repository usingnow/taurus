jQuery ->
  jQuery("#save_consignee").live 'click', (event) ->
    flag = true

    if jQuery('#receiver').val() == ""
      jQuery("#receiver_error").addClass("error_info").html("收货人姓名不能为空！")
      flag = false
    else
      jQuery("#receiver_error").removeClass("error_info").html("")

    if jQuery('#consignee_info_district_no').val() == ""
      jQuery("#consignee_info_district_no_error").addClass("error_info").html("区域信息不完整！")
      flag = false
    else
      jQuery("#consignee_info_district_no_error").removeClass("error_info").html("")

    if jQuery('#address').val() == ""
      jQuery("#address_error").addClass("error_info").html("送货地址不能为空！")
      flag = false
    else
      jQuery("#address_error").removeClass("error_info").html("")

    if jQuery('#phone').val() == "" && jQuery('#cellphone').val() == ""
      jQuery("#phone_error").addClass("error_info").html("固话与手机至少填写一项！")
      jQuery("#cellphone_error").addClass("error_info").html("固话与手机至少填写一项！")
      flag = false
    else
      jQuery("#phone_error").removeClass("error_info").html("")
      jQuery("#cellphone_error").removeClass("error_info").html("")

    if flag
      jQuery.ajax '/user/consignee_infos',
      type: 'POST'
      data: jQuery('#consignee_form').serialize()
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        if data == "failure"
          alert '出错啦！'
        else
          jQuery("#consignee_form").html('<p><label for="receiver">收件人姓名：</label>'+data.name+'</p>'+
            '<p><label for="location_province">所属区域：</label>'+data.district_no+'</p>'+
            '<p><label for="address">送货地址：</label>'+data.address+'</p>'+
            '<p><label for="area_num">固定电话：</label>'+data.phone+'</p>'+
            '<p><label for="cellphone">移动电话：</label>'+data.mobile+'</p>'+
            '<p><label for="email">电子邮件：</label>'+data.email+'<br /></p>'+
            '<p><label for="post">邮政编码：</label>'+data.zip+'<br /></p>')
          jQuery('#consignee_modify').attr("class","modify").html("[修改]")


  jQuery("#consignee_modify").live 'click', (event) ->
    jQuery.ajax '/user/consignee_infos',
      type: 'GET'
      data: 'consignee_modify=' + jQuery("#consignee_modify").attr("class")
      success: (data) ->
        if jQuery("#consignee_modify").attr("class") == "close"
          jQuery("#consignee_form").html(data)
          jQuery('#consignee_modify').attr("class","modify").html("[修改]")
        else
          jQuery("#consignee_form").html(data)
          jQuery('#consignee_modify').attr("class","close").html("[关闭]")


  jQuery("#add_user_address").live 'click', (event) ->
    jQuery.ajax '/user/user_addresses',
      type: 'POST'
      data: jQuery('#consignee_form').serialize()
      success: (data) ->
        if data == "failure"
          alert "您当前已经存在了一个相同收货人姓名且相同收货地址的记录，不需要重复增加！"
        else
          jQuery('#user_address').html(data)

  jQuery("#delete_user_address").live 'click', (event) ->
    jQuery.ajax '/user/user_addresses/' + jQuery(this).parent().parent().attr("id"),
      type: 'DELETE'
      success: (data) ->
        jQuery('#user_address').html(data)



  jQuery(".radio").click ->
      value = @value
      if value != "2"
        if jQuery("#invoice_head").html() == ""
          jQuery("#invoice_head").html('<label for="invoice_title"><em class="remark">*</em>开票抬头：</label>'+
                                       '<input name="temp_payment[is_invoice_head]" type="radio" value="0" class="input_width_35 invoice_head" checked="checked" />个人'+
                                       '<input name="temp_payment[is_invoice_head]" type="radio" value="1" class="input_width_35 invoice_head" />单位')
        jQuery(".invoice_head").click ->
          if @value == "0"
            jQuery("#title_company_name").html("")
          else
            jQuery("#title_company_name").html('<label for="invoice_title"><em class="remark">*</em>单位名称：</label>'+
                                               '<input name="temp_payment[company_name]" type="text" id="company_name"/>'+
                                               '<span id="company_name_error"></span>')

        if @value == "0"
          jQuery("#type_invoice").html("")
        else
          str = '<p><label for="invoice_title"><em class="remark">*</em>开户银行：</label>'+
                '<input name="temp_payment[account_bank]" id="account_bank" type="text" />'+
                '<span id="account_bank_error"></span></p>'+

                '<p><label for="invoice_title"><em class="remark">*</em>开户名称：</label>'+
                '<input name="temp_payment[account_person_name]" id="account_person_name" type="text" />'+
                '<span id="account_person_name_error"></span></p>'+

                '<p><label for="invoice_title"><em class="remark">*</em>注册电话：</label>'+
                '<input name="temp_payment[account_phone]" id="account_phone" type="text" />'+
                '<span id="account_phone_error"></span></p>'+

                '<p><label for="invoice_title"><em class="remark">*</em>银行帐号：</label>'+
                '<input name="temp_payment[account_no]" id="account_no" type="text" />'+
                '<span id="account_no_error"></span></p>'+

                '<p><label for="invoice_title"><em class="remark">*</em>增值税登记号：</label>'+
                '<input name="temp_payment[added_value_tax_no]" id="added_value_tax_no" type="text" />'+
                '<span id="added_value_tax_no_error"></span></p>'+

                '<p><label for="invoice_title"><em class="remark">*</em>注册地址：</label>'+
                '<input name="temp_payment[account_reg_add]" id="account_reg_add" type="text" />'+
                '<span id="account_reg_add_error"></span></p>'
          jQuery("#type_invoice").html(str)

      else
        jQuery("#invoice_head").html("")
        jQuery("#type_invoice").html("")





  jQuery("#preview_order").click ->
    flag = true

    if jQuery("#save_consignee").length > 0
      jQuery("#preview_order_error").addClass("error_info").html("请先保存“收货人信息”！")
      flag = false
    else
      if jQuery("#receiver_span").html() == ""
        jQuery("#preview_order_error").addClass("error_info").html("“收货人信息”资料不完整！")
        flag = false
      else
        jQuery("#preview_order_error").removeClass("error_info").html("")


    if jQuery("#company_name").val() == ""
      jQuery("#company_name_error").addClass("error_info").html("单位名称不能为空！")
      flag = false
    else
      jQuery("#company_name_error").removeClass("error_info").html("")

    if jQuery("#account_bank").val() == ""
      jQuery("#account_bank_error").addClass("error_info").html("开户银行不能为空！")
      flag = false
    else
      jQuery("#account_bank_error").removeClass("error_info").html("")

    if jQuery("#account_person_name").val() == ""
      jQuery("#account_person_name_error").addClass("error_info").html("开户名称不能为空！")
      flag = false
    else
      jQuery("#account_person_name_error").removeClass("error_info").html("")

    if jQuery("#account_phone").val() == ""
      jQuery("#account_phone_error").addClass("error_info").html("注册电话不能为空！")
      flag = false
    else
      jQuery("#account_phone_error").removeClass("error_info").html("")

    if jQuery("#account_no").val() == "" && jQuery("#account_no").val() != "undefined"
      jQuery("#account_no_error").addClass("error_info").html("银行帐号不能为空！")
      flag = false
    else
      jQuery("#account_no_error").removeClass("error_info").html("")

    if jQuery("#added_value_tax_no").val() == ""
      jQuery("#added_value_tax_no_error").addClass("error_info").html("增值税登记号不能为空！")
      flag = false
    else
      jQuery("#added_value_tax_no_error").removeClass("error_info").html("")

    if jQuery("#account_reg_add").val() == ""
      jQuery("#account_reg_add_error").addClass("error_info").html("注册地址不能为空！")
      flag = false
    else
      jQuery("#account_reg_add_error").removeClass("error_info").html("")


    if flag == true
      jQuery("#preview_form").submit()

