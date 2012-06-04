jQuery ->
  jQuery("#add_rule_to_promotion").click ->
    jQuery.ajax '/admin/promotions/'+jQuery("#promotion_id").val()+'/promotion_rules'
      type: 'POST',
      data: {'rule_type':jQuery("#promotion_rule").val()},
      dataType: 'script'

  jQuery(".rule_close").live 'click', (event) ->
    jQuery.ajax '/admin/promotions/'+jQuery("#promotion_id").val()+'/promotion_rules/'+jQuery(this).attr("data-id"),
      type: 'DELETE',
      data: '',
      dataType: 'script'

  jQuery('#email').bind 'railsAutocomplete.select', (event, data) ->
    jQuery.ajax '/admin/promotions/'+data.item.id+'/add_user',
      type: 'GET',
      data: '',
      dataType: 'script'

  jQuery('#role_name').bind 'railsAutocomplete.select', (event, data) ->
    jQuery.ajax '/admin/promotions/'+data.item.id+'/add_role',
      type: 'GET',
      data: '',
      dataType: 'script'


  jQuery("#add_action_to_promotion").click ->
    jQuery.ajax '/admin/promotions/'+jQuery("#promotion_id").val()+'/promotion_actions'
      type: 'POST',
      data: {'action_type':jQuery("#promotion_action").val()},
      dataType: 'script'        

  jQuery(".action_close").live 'click', (event) ->
    jQuery.ajax '/admin/promotions/'+jQuery("#promotion_id").val()+'/promotion_actions/'+jQuery(this).attr("data-id"),
      type: 'DELETE',
      data: '',
      dataType: 'script'   

  jQuery('#category_name').bind 'railsAutocomplete.select', (event, data) ->
    jQuery.ajax '/admin/promotions/'+data.item.id+'/add_category',
      type: 'GET',
      data: '',
      dataType: 'script'
