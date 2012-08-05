#= require taurus/jquery.placeholder.min

jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("[rel='popover']").popover()
  $("a.disabled").click -> return false
  $('input, textarea').placeholder()