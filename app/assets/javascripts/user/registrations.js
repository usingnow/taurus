//= require core/validation/formValidator
//= require core/validation/formValidatorRegex


jQuery(document).ready(function(){
  jQuery.formValidator.initConfig({formid:"user_new",debug:false,submitonce:true});

  jQuery("#user_login_no").formValidator({
	onshow:"请输入用户名",
	onfocus:"用户名至少5个字符,最多25个字符",
	oncorrect:"该用户名可以注册"
  }).inputValidator({
	min:5,
	max:25,
	onerror:"你输入的用户名非法,请确认"
	  }).regexValidator({
		regexp:"username",
		datatype:"enum",
		onerror:"用户名格式不正确"});


  jQuery("#user_password").formValidator({
	onshow:"请输入密码",
	onfocus:"至少6个长度",
	oncorrect:"密码合法"
  }).inputValidator({
	min:6,
	empty:{
	  leftempty:false,
	  rightempty:false,
	  emptyerror:"密码两边不能有空符号"
	},
	onerror:"密码非法,请确认"});

  jQuery("#user_password_confirmation").formValidator({
	onshow:"输再次输入密码",
	onfocus:"至少6个长度",
	oncorrect:"密码一致"
  }).inputValidator({
	min:6,
	empty:{
	  leftempty:false,
	  rightempty:false,
	  emptyerror:"确认密码两边不能有空符号"
	},
	onerror:"密码非法,请确认"
  	}).compareValidator({
		desid:"user_password",
		operateor:"=",
		onerror:"2次密码不一致,请确认"});
});









