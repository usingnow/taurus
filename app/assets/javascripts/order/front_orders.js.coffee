jQuery ->
  jQuery(".radio").click ->
    value = @value
    if value != "2"
      jQuery("#invoice_head").html('<label for="invoice_title"><em class="remark">*</em>开票抬头：</label>'+
                                   '<input name="temp_payment[is_invoice_head]" type="radio" value="0" class="input_width_35 invoice_head" checked="checked" />个人'+
                                   '<input name="temp_payment[is_invoice_head]" type="radio" value="1" class="input_width_35 invoice_head" />单位')
      jQuery(".invoice_head").click ->
        if @value == "0"
          jQuery("#title_company_name").html("")
        else
          jQuery("#title_company_name").html('<label for="invoice_title"><em class="remark">*</em>单位名称：</label>'+
                                             '<input name="temp_payment[company_name]" type="text" />')

      if @value == "0"
        jQuery("#type_invoice").html("")
      else
        str = ''
        str+= '<p><label for="invoice_title"><em class="remark">*</em>开户银行：</label><input name="temp_payment[account_bank]" type="text" /></p>'
        str+= '<p><label for="invoice_title"><em class="remark">*</em>开户名称：</label><input name="temp_payment[account_person_name]" type="text" /></p>'
        str+= '<p><label for="invoice_title"><em class="remark">*</em>注册电话：</label><input name="temp_payment[account_phone]" type="text" /></p>'
        str+= '<p><label for="invoice_title"><em class="remark">*</em>银行帐号：</label><input name="temp_payment[account_no]" type="text" /></p>'
        str+= '<p><label for="invoice_title"><em class="remark">*</em>增值税登记号：</label><input name="temp_payment[added_value_tax_no]" type="text" /></p>'
        str+= '<p><label for="invoice_title"><em class="remark">*</em>注册地址：</label><input name="temp_payment[account_reg_add]" type="text" /></p>'
        jQuery("#type_invoice").html(str)

    else
      jQuery("#invoice_head").html("")
      jQuery("#type_invoice").html("")



