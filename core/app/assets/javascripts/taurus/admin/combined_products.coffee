jQuery -> 
  jQuery('#combined_product_product_name').bind 'railsAutocomplete.select', (event, data) ->
    jQuery('#combined_product_product_name').parent().parent().addClass("success")
    jQuery('#combined_product_product_name').after("<span class='help-inline'>选择成功！</span>")


  jQuery("#add_single_product").click -> 
    flag = true
    jQuery(".combined_products").each ->
    	if jQuery(this).attr("data-related_id") == jQuery("#related_id").val()
    		flag = false
        
    if jQuery("#related_id").val() != "" && flag

      tr = "<tr class='combined_products' data-related_id=\"#{jQuery("#related_id").val()}\">
              <td>
                <a href=\"/admin/products/#{jQuery("#related_id").val()}\" 
                   target='_blank'>#{jQuery("#related_number").val()}
                </a>
              </td>
              <td>
                #{jQuery("#combined_product_product_name").val()}
                <input type='hidden' name='related_ids[]' value=\"#{jQuery("#related_id").val()}\"/>
              </td>
              <td><a href='#' class='btn btn-primary trk-btn-short remove_line_item'>删除</a></td>
            </tr>"

	    jQuery("#combined_products").append(tr)
    false

  jQuery(".remove_line_item").live 'click', (event) ->
  	jQuery(this).parent().parent().remove()
  	false
			      
			      
			        
	
