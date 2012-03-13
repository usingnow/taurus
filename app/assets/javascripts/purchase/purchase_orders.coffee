jQuery ->
  jQuery(".new_product_purchase_amount").live 'change', (event) ->
    jQuery.ajax '/purchase/po_product_temp_lists/'+jQuery(this).attr("data-id"),
      type: 'PUT',
      data: 'product_purchase_amount=' + @value,
      dataType: 'script'

  jQuery(".edit_product_purchase_amount").live 'change', (event) ->
    jQuery.ajax '/purchase/po_product_lists/'+jQuery(this).attr("data-id"),
      type: 'PUT',
      data: 'product_purchase_amount=' + @value,
      dataType: 'script'

  jQuery("#purchase_order_ordering_company_id").change ->
    jQuery.ajax '/admin/ordering_companies/'+@value,
      type: 'GET',
      data: '',
      dataType: 'json',
      success:(data) ->
        jQuery("#ordering_company_address").html(data.address)
        jQuery("#ordering_company_phone").html(data.phone)

  jQuery("#check_supplier_id").click ->
    jQuery.ajax '/purchase/purchase_orders/check_supplier_id',
      type: 'GET',
      data: 'supplier_id='+jQuery("#supplier_id").val(),
      dataType: 'json',
      success:(data) ->
        if data
          jQuery("#purchase_order_supplier_id").val(data.id)
          jQuery("#supplier_name").html(data.name)
          jQuery("#supplier_contact_way").html(data.contact_way)
          jQuery("#supplier_fax").html(data.fax)
        else
          alert "编号不存在"