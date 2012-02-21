#= require commodity/_hot

jQuery ->
  jQuery("#change_ver_code").click ->
    jQuery('#ver_code').attr("src","/codes?" + Math.random())
    false
