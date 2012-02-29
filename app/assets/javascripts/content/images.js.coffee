jQuery ->
  jQuery("#q_page_eq").change ->
    if @value == ""
      jQuery("#q_location_eq").html("<option value=''>全部</option>")
    else
      jQuery.ajax '/content/images/change_page',
        type: 'GET'
        data: 'page='+@value
        success: (data) ->
          jQuery("#q_location_eq").html("")
          jQuery.each data, (key, value) =>
            jQuery("#q_location_eq").append("<option value='"+key+"'>"+value+"</option>")
          false

    false

  jQuery("#image_page").change ->
    jQuery.ajax '/content/images/change_page',
      type: 'GET'
      data: 'page='+@value
      success: (data) ->
        jQuery("#image_location").html("")
        jQuery.each data, (key, value) =>
          jQuery("#image_location").append("<option value='"+key+"'>"+value+"</option>")
        false
    false

  false