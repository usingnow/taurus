#= require jquery
#= require jquery_ujs
#= require jquery-ui-1.8.16.custom.min
#= require player

jQuery ->
  jQuery.ajax '/cart/cart_skuships/current_skus',
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      jQuery('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      jQuery('#total_items').html(data)

  jQuery("#sku_search").click ->
    jQuery("#sku_search_form").submit()
    false

  jQuery("#copy_paper").click ->
    jQuery("#q_name_cont").val("复印纸")
    jQuery("#sku_search_form").submit()
    false

  jQuery("#gel_pen").click ->
    jQuery("#q_name_cont").val("中性笔")
    jQuery("#sku_search_form").submit()
    false

  jQuery("#rolls").click ->
    jQuery("#q_name_cont").val("卷纸")
    jQuery("#sku_search_form").submit()
    false