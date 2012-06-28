jQuery -> 
  jQuery(".logo_img").click ->
  	jQuery("#normal_img").attr("src", jQuery(this).attr("href"))
  	false