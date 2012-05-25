jQuery -> 
  jQuery("#add_replenishment_record_sku").click -> 
    flag = true
    jQuery(".sku_line_item").each ->
    	if jQuery(this).attr("data-sku_id") == jQuery("#replenishment_record_sku_id").val()
    		flag = false
    if jQuery("#replenishment_record_sku_id").val() != "" && flag

	    jQuery("#line_items").append(
	      "<tr class='sku_line_item' data-sku_id=\""+jQuery("#replenishment_record_sku_id").val()+"\">"+
		      "<td>"+jQuery("#replenishment_record_sku_number").val()+"</td>"+
		      "<td>"+jQuery("#replenishment_record_sku_name").val()+"</td>"+
		      "<td>"+
		      	"<input name='sku_amount["+jQuery("#replenishment_record_sku_id").val()+"]' "+
                   "class='numeric integer required' "+
		      		     "step='1' type='number' value='"+jQuery("#replenishment_record_sku_amount").val()+"'/>"+
		     "</td>"+
		     "<td><a href='#' class='btn btn-primary trk-btn-short remove_line_item'>删除</a></td></tr>"
		    )
    false

  jQuery(".remove_line_item").live 'click', (event) ->
  	jQuery(this).parent().parent().remove()
  	false
			      
			      
			        
	
