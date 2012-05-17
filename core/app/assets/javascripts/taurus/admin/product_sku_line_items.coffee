jQuery -> 
  jQuery('#product_sku_line_item_sku_name').bind 'railsAutocomplete.select', (event, data) ->
  	jQuery.ajax '/admin/products/'+jQuery("#product_id").val()+'/product_sku_line_items/'+data.item.id+'/show_sku',
      type: 'GET',
      data: '',
      dataType: 'script'

  jQuery("#add_product_sku").click -> 
    flag = true
    jQuery(".sku_line_item").each ->
    	if jQuery(this).attr("data-sku_id") == jQuery("#sku_id").val()
    		flag = false
    if jQuery("#sku_id").length != 0 && flag
	    jQuery("#line_items").append(
	      "<tr class='sku_line_item' data-sku_id=\""+jQuery("#sku_id").val()+"\">"+
		      "<td>"+jQuery("#sku_number").text()+"</td>"+
		      "<td>"+jQuery("#product_sku_line_item_sku_name").val()+"</td>"+
		      "<td>"+
		      	"<input name='sku_amount["+jQuery("#sku_id").val()+"]' class='numeric integer required' "+
		      		     "step='1' type='number' value='"+jQuery("#product_sku_line_item_sku_amount").val()+"'/>"+
		     "</td>"+
		     "<td><a href='#' class='btn btn-primary trk-btn-short remove_line_item'>删除</a></td></tr>"
		    )
    false

  jQuery(".remove_line_item").live 'click', (event) ->
  	jQuery(this).parent().parent().remove()
  	false
			      
			      
			        
	
