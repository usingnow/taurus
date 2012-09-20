jQuery ->
  # --- 列表页面 ---
  # 修改确认支付form链接
  $(".confirm-modal").click ->
    $('#confirm-payment-form').attr('action', "/admin/orders/#{$(this).attr('href').substring(1)}/confirm_online_payment")
    $('#confirm-payment-modal').modal('show')
  
  # --- 新建页面 ---
  # 绑定客户名称自动完成事件
  jQuery('#order_customer_name').bind 'railsAutocomplete.select', (event, data) ->
    jQuery('#order_customer_name').next().remove()
    jQuery('#order_customer_name').parent().parent().addClass("success")
    jQuery('#order_customer_name').after("<span class='help-inline'>选择成功，请继续选择商品。</span>")
  
  # 绑定商品名称自动完成事件
  jQuery('#product_name').bind 'railsAutocomplete.select', (event, data) ->
    jQuery('#product_name').next().remove()
    jQuery('#product_name').parent().parent().addClass("success")
    jQuery('#product_name').after("<span class='help-inline'>选择成功，请点击添加商品按钮。</span>")

  # 绑定添加商品事件
  jQuery("#add_product").click -> 
    flag = true
    
    jQuery(".products").each ->
      if jQuery(this).attr("data-product_id") == jQuery("#product_id").val()
        flag = false
        
    if jQuery("#product_id").val() != "" && flag

      tr = "<tr class='products' data-product_id=\"#{jQuery("#product_id").val()}\">
              <td>
                <a href=\"/admin/products/#{jQuery("#product_id").val()}\" 
                   target='_blank'>#{jQuery("#product_number").val()}
                </a>
              </td>
              <td>
                #{jQuery("#product_name").val()}
              </td>
              <td>
                #{jQuery("#product_unit_price").val()}
              </td>
              <td>
                <input class='amount span1' name='amount[#{jQuery("#product_id").val()}]' 
                       step='1' type='number' value=\"#{jQuery("#product_amount").val()}\"></td>
              <td>
                <a href='#' class='btn btn-primary trk-btn-short remove_line_item'>删除</a>
              </td>
            </tr>"

      jQuery('#product_name').next().remove()
      jQuery('#product_name').parent().parent().removeClass("success")
      jQuery("#products").append(tr)
    false
  
  # 删除商品
  jQuery(".remove_line_item").live 'click', (event) ->
    jQuery(this).parent().parent().remove()
    false
  
  # 验证商品数量
  jQuery(".amount").live 'change', (event)->
    if @value.search("^-?\\d+$") != 0
      jQuery(this).val(1)
    else
      jQuery(this).val(1) if @value < 1