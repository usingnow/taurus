#= require promotion/promotion_by_orders
#= require promotion/promotion_by_products

jQuery ->
  jQuery(".chose_sku").click ->
    window.opener.jQuery("#sku_id").val(jQuery(this).attr("data-id"))
    window.opener.jQuery("#sku_name").val(jQuery(this).attr("data-name"))
    window.close()

  jQuery("#close_promotion").click ->
    window.open(jQuery(this).attr("href"),'','height=600,width=800')
    false

  jQuery(".add_priorities").click ->
    window.open(jQuery(this).attr("href"),'','height=600,width=800')
    false


