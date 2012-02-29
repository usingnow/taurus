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
    value = @value
    jQuery.ajax '/content/images/change_page',
      type: 'GET'
      data: 'page='+value
      success: (data) ->
        jQuery("#image_location").html("")
        jQuery.each data, (key, value) =>
          jQuery("#image_location").append("<option value='"+key+"'>"+value+"</option>")

        i0 = "/assets/content/images/homepage_cms.png"
        i1 = "/assets/content/images/oa_pc_cms.png"
        i2 = "/assets/content/images/stationary_cms.png"
        i3 = "/assets/content/images/daily_necessities_cms.png"
        i4 = "/assets/content/images/office_furniture_cms.png"
        i5 = "/assets/content/images/furniture_cms.png"
        i6 = "/assets/content/images/house_decorations_cms.png"

        jQuery("#cms_image").attr("src",eval("i"+value))
        false
    false

  false