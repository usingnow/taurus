window.Validates =
  phone: (number) ->
    reg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/
    reg.test(number)

  mobilePhone: (number) ->
    reg = /^13[0-9]{1}[0-9]{8}$|^15[012356789]{1}[0-9]{8}$|^18[0256789]{1}[0-9]{8}$/
    reg.test(number)