#= require core/validation/formValidator
#= require core/validation/formValidatorRegex

jQuery ->
  jQuery.formValidator.initConfig({formid:"new_subscribe",debug:false,submitonce:true})

  jQuery("#subscribe_email").formValidator({
    onshow:"请填写邮箱"
  }).regexValidator({
    regexp:"email",
    datatype:"enum",
    onerror:"邮箱格式不正确"})

