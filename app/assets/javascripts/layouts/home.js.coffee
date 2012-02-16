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