jQuery ->
  jQuery(".entry_quantity").change ->
    if @value.search("^-?\\d+$") != 0
      jQuery(this).val(0)
    else
      if @value < 0
        jQuery(this).val(0)