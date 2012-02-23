#= require plugin/jquery.jqzoom-core-pack
#= require plugin/jquery.jcarousel.min

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
    if jQuery("#sku_quantity").val() > 1
      jQuery('#sku_quantity').val( jQuery('#sku_quantity').val() - 1 )
    else
      jQuery('#sku_quantity').val(1)

  jQuery('#plus').click ->
    jQuery('#sku_quantity').val( Number(jQuery('#sku_quantity').val()) + 1 )


  jQuery("#sku_quantity").change ->
    if @value.search("^-?\\d+$") != 0
      jQuery('#sku_quantity').val(1)
    else
      if @value < 1
        jQuery('#sku_quantity').val(1)

  jQuery('.jqzoom').jqzoom ->
    zoomType: 'standard',
    lens:true,
    preloadImages: false,
    alwaysOn:false

  jQuery('#sku_carousel').jcarousel ->
    	wrap: 'circular'