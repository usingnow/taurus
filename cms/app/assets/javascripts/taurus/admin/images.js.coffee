jQuery ->
  jQuery(".page_button").click ->
    jQuery("#q_page_eq").val(@value)
    jQuery("#image_search").submit()

  jQuery("#image_page").change ->
    value = @value
    jQuery.ajax '/admin/images/change_page',
      type: 'GET'
      data: 'page='+value
      success: (data) ->
        jQuery("#image_location").html("")
        jQuery.each data, (key, value) =>
          jQuery("#image_location").append("<option value='"+key+"'>"+value+"</option>")

        i0 = "/assets/taurus/admin/images/homepage_cms.png"
        i1 = "/assets/taurus/admin/images/oa_pc_cms.png"
        i2 = "/assets/taurus/admin/images/stationary_cms.png"
        i3 = "/assets/taurus/admin/images/daily_necessities_cms.png"
        i4 = "/assets/taurus/admin/images/office_furniture_cms.png"
        i5 = "/assets/taurus/admin/images/furniture_cms.png"
        i6 = "/assets/taurus/admin/images/house_decorations_cms.png"

        jQuery("#cms_image").attr("src",eval("i"+value))
        false
    false

  false