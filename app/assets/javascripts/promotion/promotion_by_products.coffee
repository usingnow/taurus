jQuery ->
  jQuery("#promotion_by_product_online_promotion_attributes_sign_up_time_limit").change ->
    if @value == "false"
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_start_1i").attr("disabled","disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_start_2i").attr("disabled","disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_start_3i").attr("disabled","disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_end_1i").attr("disabled","disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_end_2i").attr("disabled","disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_end_3i").attr("disabled","disabled")
    else
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_start_1i").removeAttr("disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_start_2i").removeAttr("disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_start_3i").removeAttr("disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_end_1i").removeAttr("disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_end_2i").removeAttr("disabled")
      jQuery("#promotion_by_product_online_promotion_attributes_member_sign_up_end_3i").removeAttr("disabled")


  if jQuery("#promotion_by_product_online_promotion_attributes_member_type").val() != "0"
    jQuery("#promotion_by_product_online_promotion_attributes_member_type").after("<a href='#' id='set_member' class='link'>设置</a>")

  jQuery("#promotion_by_product_online_promotion_attributes_member_type").change ->
    jQuery("#set_member").remove()
    if @value != "0"
      jQuery(this).after("<a href='#' id='set_member' class='link'>设置</a>")

  jQuery("#set_member").live 'click',(event) ->
    window.open('/promotion/promotion_member_temps?member_type='+jQuery("#promotion_by_product_online_promotion_attributes_member_type").val(),'','height=600,width=800')


  if jQuery("#promotion_by_product_products_selection").val() != "0"
    jQuery("#promotion_by_product_products_selection").after("<a href='#' id='set_product' class='link'>设置</a>")

  jQuery("#promotion_by_product_products_selection").change ->
    jQuery("#set_product").remove()
    if @value != "0"
      jQuery(this).after("<a href='#' id='set_product' class='link'>设置</a>")

  jQuery("#set_product").live 'click',(event) ->
    window.open('/promotion/promotion_product_temps?products_selection='+jQuery("#promotion_by_product_products_selection").val(),'','height=600,width=800')

  jQuery("#set_sku").click ->
    window.open('/promotion/online_promotions/search_skus','','height=600,width=800')

  jQuery("#empty_sku").click ->
    jQuery("#sku_id").val("")
    jQuery("#sku_name").val("")