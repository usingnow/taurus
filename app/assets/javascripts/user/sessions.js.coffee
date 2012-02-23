#= require core/validation

jQuery ->
  jQuery("#change_ver_code").click ->
    jQuery('#ver_code').attr("src","/codes?" + Math.random())
    false

  jQuery("#login").click ->
    flag = true

    if jQuery('#user_login_no').val() == ""
      jQuery("#user_login_no_error").addClass("error_info").html("必填！")
      flag = false
    else
      jQuery("#user_login_no_error").removeClass("error_info").html("")

    if jQuery('#user_password').val() == ""
      jQuery("#user_password_error").addClass("error_info").html("必填！")
      flag = false
    else
      jQuery("#user_password_error").removeClass("error_info").html("")

    if jQuery('#code').val() == ""
      jQuery("#code_error").addClass("error_info").html("必填！")
      flag = false
    else
      jQuery("#code_error").removeClass("error_info").html("")

    if flag
      jQuery("#user_new").submit()
