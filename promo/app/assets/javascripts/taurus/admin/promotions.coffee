jQuery ->
  jQuery("#add_rule_to_promotion").click ->
    jQuery.ajax '/admin/promotions/'+jQuery("#promotion_id").val()+'/promotion_rules'
      type: 'POST',
      data: {'rule_type':jQuery("#promotion_rule").val()},
      dataType: 'script'

  jQuery(".close").live 'click', (event) ->
    jQuery.ajax '/admin/promotions/'+jQuery("#promotion_id").val()+'/promotion_rules/'+jQuery(this).attr("data-id"),
      type: 'DELETE',
      data: '',
      dataType: 'script'

  jQuery('#email').bind 'railsAutocomplete.select', (event, data) ->
    jQuery.ajax '/admin/promotions/'+data.item.id+'/add_user',
      type: 'GET',
      data: '',
      dataType: 'script'