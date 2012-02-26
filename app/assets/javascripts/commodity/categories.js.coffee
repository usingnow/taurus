#= require commodity/_hot

jQuery ->
  if jQuery("#total_sale").attr('class') != "sort_link"
    jQuery("#total_sale").parent().addClass("current_tab")

  else if jQuery("#price").attr('class') != "sort_link"
    jQuery("#price").parent().addClass("current_tab")

  else if jQuery("#on_shelf_time").attr('class') != "sort_link"
    jQuery("#on_shelf_time").parent().addClass("current_tab")


  jQuery(".add_to_cart").click ->
    jQuery.ajax '/cart/cart_skuships',
      type: 'POST'
      data: 'sku_id='+jQuery(this).attr("id")+'&quantity=1'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        jQuery('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        jQuery('#total_items').html(data)
        alert "添加成功"

  jQuery(".add_to_favorite").click ->
    jQuery.ajax '/user/index/favorites',
      type: 'POST'
      data: 'sku_id='+jQuery(this).attr("id")
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        jQuery('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        alert data