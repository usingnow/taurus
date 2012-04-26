jQuery ->
  jQuery(".back_order_sku_quantity").live 'change',(event) ->
    jQuery.ajax jQuery(this).attr('data-href'),
                type: "put",
                data: 'value=' + @value

  jQuery('.back_order_sku_is_need_install').live 'change', (event) ->
    if jQuery(this).attr('checked') == "checked"
      is_need_install = true
    else
      is_need_install = false

    jQuery.ajax jQuery(this).attr("data-href"),
                type: 'PUT'
                data: 'is_need_install=' + is_need_install

  jQuery('.back_order_sku_is_need_assemble').live 'change', (event) ->
    if jQuery(this).attr('checked') == "checked"
      is_need_assemble = true
    else
      is_need_assemble = false

    jQuery.ajax jQuery(this).attr("data-href"),
                type: 'PUT'
                data: 'is_need_assemble=' + is_need_assemble


