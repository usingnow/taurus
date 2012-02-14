Number.prototype.toCurrency = ->
  match = this.toString().match(/^-?(\d+)(\.\d+)?$/)
  return unless match

  cents = if match[2] then (match[2] + '00').substr(1, 2) else '00'
  dollars = match[1].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')

  result = "￥#{dollars}.#{cents}"
  result = '-' + result if this < 0

  result

jQuery ->
  jQuery('#go_settlement').click ->
    window.location.href = "/order/front_orders"

  jQuery('#continue_shopping').click ->
    window.location.href = "/"

  jQuery(".cart_sku_quantity").change ->
    id = jQuery(this).parent().parent().attr('id')
    jQuery.ajax '/cart/cart_skuships/' + id,
      type: 'PUT'
      data: 'quantity='+jQuery(this).val()
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        jQuery('#total_sku_amount').html(Number(data.total_sku_amount).toCurrency())
        jQuery('#total_amount').html(Number(data.total_amount).toCurrency())
        jQuery('#subtotal'+id).html(Number(data.subtotal).toCurrency())

  jQuery('.cart_sku_is_need_install').change ->
    if jQuery(this).attr('checked') == "checked"
      is_need_install = 1
    else
      is_need_install = 0

    id = jQuery(this).parent().parent().attr('id')

    jQuery.ajax '/cart/cart_skuships/' + id,
      type: 'PUT'
      data: 'is_need_install=' + is_need_install
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        jQuery('#total_installation_amount').html(Number(data.total_installation_amount).toCurrency())
        jQuery('#total_amount').html(Number(data.total_amount).toCurrency())
        jQuery('#subtotal'+id).html(Number(data.subtotal).toCurrency())

