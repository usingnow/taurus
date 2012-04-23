jQuery ->
  jQuery(".first_sku_sort").addClass("highlight").children("a").show().end().siblings().removeClass("highlight").children("a").hide()

  jQuery(".has_children").click ->
    jQuery(this).addClass("highlight").children("a").show().end().siblings().removeClass("highlight").children("a").hide()