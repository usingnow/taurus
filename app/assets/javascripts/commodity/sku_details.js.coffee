#= require plugin/jquery.jqzoom-core-pack
#= require plugin/jquery.jcarousel.min
#= require core/rating/jquery.rating.pack

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
        jQuery('#add_successful').attr("class","successful").html("您选择的商品已经成功添加！")


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


  jQuery("#add_to_favorite").click ->
    jQuery.ajax '/user/index/favorites',
      type: 'POST'
      data: 'sku_id='+jQuery("#sku_id").val()
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        jQuery('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        jQuery('#add_successful').attr("class","successful").html(data)


  if jQuery("#alert").text().length > 0
    alert jQuery("#alert").text()