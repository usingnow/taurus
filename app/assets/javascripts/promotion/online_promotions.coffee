jQuery ->
  jQuery(".chose_sku").click ->
    window.opener.jQuery("#sku_id").val(jQuery(this).attr("data-id"))
    window.opener.jQuery("#sku_name").val(jQuery(this).attr("data-name"))
    window.close()