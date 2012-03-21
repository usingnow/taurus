jQuery ->
  if jQuery("#other_cost").length > 0 || jQuery("#carriage_adjustment").length > 0
    jQuery("#order_price_info").css("width","550px")


  jQuery(".order_details_quantity").live 'change', (event) ->
    jQuery.ajax "/admin/order_details/"+jQuery(this).attr("data-id"),
      type: "put",
      data: {'value':@value,'order_id':jQuery("#order_id").val()},
      dataType: 'script'

  jQuery('#other_cost_update').live 'click',(event) ->
    jQuery.ajax '/order/back_orders/'+jQuery("#order_id").val()+'/other_cost',
      type: "put",
      data: {"order[other_cost]": jQuery('#other_cost').val()},
      dataType: 'script'

  jQuery('#carriage_adjustment_update').live 'click',(event) ->
      jQuery.ajax "/order/back_orders/"+jQuery("#order_id").val()+"/carriage_adjustment",
        type: "put",
        data: {"order[carriage_adjustment]": jQuery('#carriage_adjustment').val()},
        dataType: 'script'

  jQuery('#add_to_user_addresses').click ->
    jQuery.ajax "/order/back_orders/"+jQuery("#order_id").val()+"/create_user_address",
      type: "POST",
      data: {
        "order[name]": jQuery('#order_name').val(),
        "order[district_no]":jQuery("#order_district_no").val(),
        "order[address]":jQuery("#order_address").val(),
        "order[phone]":jQuery("#order_phone").val(),
        "order[mobile]":jQuery("#order_mobile").val(),
        "order[email]":jQuery("#order_email").val(),
        "order[zip]":jQuery("#order_zip").val()},
      dataType: 'script'
    false

  jQuery('.user_address_radio').live 'click',(event) ->
    jQuery.ajax "/order/back_orders/"+jQuery(this).val()+"/show_user_address",
      type: "GET",
      data: "",
      dataType: 'script'

