jQuery ->
	jQuery('#province_id').change ->
    jQuery.ajax '/areas/cities',
      type: "GET",
      data: {"province_id":  @value},
      dataType: 'script'	

  jQuery('#city_id').change ->
    jQuery.ajax '/areas/districts',
      type: "GET",
      data: {"city_id":  @value},
      dataType: 'script'    