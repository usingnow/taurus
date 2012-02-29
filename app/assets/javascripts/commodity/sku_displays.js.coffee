jQuery ->
  jQuery("#q_page_eq").change ->
    if @value == ""
      jQuery("#q_location_eq").html("<option value=''>全部</option>")
    else
      jQuery.ajax '/commodity/sku_displays/change_page',
        type: 'GET'
        data: 'page='+@value
        success: (data) ->
          jQuery("#q_location_eq").html("")
          jQuery.each data, (key, value) =>
            jQuery("#q_location_eq").append("<option value='"+key+"'>"+value+"</option>")
          false

    false

  jQuery("#sku_display_page").change ->
    jQuery.ajax '/commodity/sku_displays/change_page',
      type: 'GET'
      data: 'page='+@value
      success: (data) ->
        jQuery("#sku_display_location").html("")
        jQuery.each data, (key, value) =>
          jQuery("#sku_display_location").append("<option value='"+key+"'>"+value+"</option>")
        false
    false

  false