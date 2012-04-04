jQuery ->
  jQuery(".chose_sku").click ->
    window.opener.jQuery("#promotion_by_order_online_promotion_attributes_sku_id").val(jQuery(this).attr("data-id"))
    window.opener.jQuery("#sku_name").val(jQuery(this).attr("data-name"))
    window.close()