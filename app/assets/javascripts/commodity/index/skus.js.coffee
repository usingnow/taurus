jQuery ->
  if jQuery("#total_sale").attr('class') != "sort_link"
    jQuery("#total_sale").parent().addClass("current_tab")

  else if jQuery("#price").attr('class') != "sort_link"
    jQuery("#price").parent().addClass("current_tab")

  else if jQuery("#on_shelf_time").attr('class') != "sort_link"
    jQuery("#on_shelf_time").parent().addClass("current_tab")