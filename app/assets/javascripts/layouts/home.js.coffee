jQuery ->
  jQuery.ajax '/cart/cart_skuships/current_skus',
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      jQuery('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      jQuery('#total_items').html(data)