jQuery ->
	$(".confirm-modal").click ->
		$('#confirm-payment-form').attr('action', "/admin/orders/#{$(this).attr('href').substring(1)}/confirm_online_payment")
		$('#confirm-payment-modal').modal('show')