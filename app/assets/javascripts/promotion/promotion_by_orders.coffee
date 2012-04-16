jQuery ->
  jQuery("#promotion_by_order_online_promotion_attributes_sign_up_time_limit").change ->
    if @value == "false"
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_start_1i").attr("disabled","disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_start_2i").attr("disabled","disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_start_3i").attr("disabled","disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_end_1i").attr("disabled","disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_end_2i").attr("disabled","disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_end_3i").attr("disabled","disabled")
    else
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_start_1i").removeAttr("disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_start_2i").removeAttr("disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_start_3i").removeAttr("disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_end_1i").removeAttr("disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_end_2i").removeAttr("disabled")
      jQuery("#promotion_by_order_online_promotion_attributes_member_sign_up_end_3i").removeAttr("disabled")


  if jQuery("#promotion_by_order_online_promotion_attributes_member_type").val() != "0"
    jQuery("#promotion_by_order_online_promotion_attributes_member_type").after("<a href='#' id='order_set_member' class='link'>设置</a>")

  jQuery("#promotion_by_order_online_promotion_attributes_member_type").change ->
    jQuery("#order_set_member").remove()
    if @value != "0"
      jQuery(this).after("<a href='#' id='order_set_member' class='link'>设置</a>")


  jQuery("#order_set_member").live 'click',(event) ->
    window.open('/promotion/promotion_member_temps?member_type='+jQuery("#promotion_by_order_online_promotion_attributes_member_type").val(),'','height=600,width=800')

  jQuery("#order_set_sku").click ->
    window.open('/promotion/online_promotions/search_skus','','height=600,width=800')

  jQuery("#order_empty_sku").click ->
    jQuery("#order_sku_id").val("")
    jQuery("#sku_name").val("")