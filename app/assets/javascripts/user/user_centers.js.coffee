#= require core/validation/formValidator
#= require core/validation/formValidatorRegex

jQuery ->
  fastSearch = (days) ->
    now = new Date()
    if days >= 1
      last = new Date(now.getTime()-86400000*days)

    yyyy = last.getFullYear()
    mm   = (last.getMonth()+1).toString()
    dd   = last.getDate().toString()

    jQuery("#q_created_at_gt_1i").val(yyyy)
    jQuery("#q_created_at_gt_2i").val(mm)
    jQuery("#q_created_at_gt_3i").val(dd)

    jQuery("#q_created_at_lt_1i").val(now.getFullYear())
    jQuery("#q_created_at_lt_2i").val(now.getMonth()+1)
    jQuery("#q_created_at_lt_3i").val(now.getDate())
    false


  jQuery("#last_one_month").click ->
    fastSearch(30)
    jQuery("#order_search").submit()
    false

  jQuery("#last_three_month").click ->
    fastSearch(90)
    jQuery("#order_search").submit()
    false

  jQuery("#last_six_month").click ->
    fastSearch(180)
    jQuery("#order_search").submit()
    false

  jQuery(".add_to_cart").click ->
    jQuery.ajax '/cart/cart_skuships',
      type: 'POST'
      data: 'sku_id='+jQuery(this).attr("id")+'&quantity=1'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        jQuery('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        jQuery('#total_items').html(data)
        alert "添加成功！"
    false

  #索取目录表单验证
  jQuery.formValidator.initConfig({formid:"new_mail_sale",debug:false,submitonce:true})

  jQuery("#mail_sale_name").formValidator({
    onshow:"请填写联系人姓名"
  }).regexValidator({
    regexp:"required",
    datatype:"enum",
    onerror:"联系人姓名必填"})

  jQuery("#mail_sale_district_no").formValidator({
    onshow:"请选择地区",
    onfocus:"地区必须选择",
  }).inputValidator({
    min:1,
    onerror: "地区必须选择"}).defaultPassed()

  jQuery("#mail_sale_address").formValidator({
    onshow:"请填写详细地址"
  }).regexValidator({
    regexp:"required",
    datatype:"enum",
    onerror:"详细地址必填"})

  jQuery("#mail_sale_zip").formValidator({
    onshow:"请填写邮政编码"
  }).regexValidator({
    regexp:"required",
    datatype:"enum",
    onerror:"邮政编码必填"})

  #jQuery("#mail_sale_phone").formValidator({
  #  onshow:"固定电话与移动电话必填一项"
  #}).regexValidator({
  #  regexp:"required",
  #  datatype:"enum",
  #  onerror:"固定电话与移动电话必填一项"})

  #jQuery("#mail_sale_mobile").formValidator({
  #  onshow:"固定电话与移动电话必填一项"
  #}).regexValidator({
  #  regexp:"mobile",
  # datatype:"enum",
  #  onerror:"固定电话与移动电话必填一项"})

  #jQuery("#mail_sales_commit").click ->
  #  if jQuery("#mail_sales_phone").val() == "" && jQuery("#mail_sale_mobile").val() != ""
  #    jQuery("#mail_sales_phone").unFormValidator(true)
  #    jQuery("#mail_sale_mobile").unFormValidator(false)
  #  else if jQuery("#mail_sales_phone").val() != "" && jQuery("#mail_sale_mobile").val() == ""
  #    jQuery("#mail_sale_mobile").unFormValidator(true)
	#	  jQuery("#mail_sales_phone").unFormValidator(false)
  #  else
	#	  jQuery("#mail_sale_mobile").unFormValidator(false)
	#	  jQuery("#mail_sales_phone").unFormValidator(false)