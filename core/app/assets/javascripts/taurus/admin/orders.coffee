jQuery ->
	$(".confirm-modal").click ->
		$('#confirm-payment-form').attr('action', "/admin/orders/#{@href.charAt(@href.length - 1)}/confirm_online_payment")
		$('#confirm-payment-modal').modal('show')