jQuery ->
  jQuery(".page_button").click ->
    jQuery("#page").val(@value)
    jQuery("#sku_display_search").submit()

  jQuery(".add_to_sku_display").click ->
    jQuery("#sku_display_sku_id").val(jQuery(this).attr("id"))
    jQuery("#create_sku_display").submit()
    false

  jQuery(".sequence_text").change ->
    jQuery.ajax '/commodity/sku_displays/'+jQuery(this).attr("data-id"),
      type: 'PUT'
      data: 'sequence='+jQuery(this).val()
      dataType: 'json'
      success: (data) ->
        alert data
    false