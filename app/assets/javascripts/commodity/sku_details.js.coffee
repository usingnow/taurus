jQuery ->
  jQuery("#add_to_cart").click ->
    jQuery.ajax '/cart/cart_skuships',
      type: 'POST'
      data: 'sku_id='+jQuery("#sku_id").val()+'&quantity='+jQuery("#sku_quantity").val()
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        jQuery('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        jQuery('#total_items').html(data)

  jQuery('#minus').click ->
    jQuery('#sku_quantity').val( jQuery('#sku_quantity').val() - 1 )

  jQuery('#plus').click ->
    jQuery('#sku_quantity').val( Number(jQuery('#sku_quantity').val()) + 1 )