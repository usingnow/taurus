jQuery ->
  faseSearch = (days) ->
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
    faseSearch(30)
    jQuery("#order_search").submit()
    false

  jQuery("#last_three_month").click ->
    faseSearch(90)
    jQuery("#order_search").submit()
    false

  jQuery("#last_six_month").click ->
    faseSearch(180)
    jQuery("#order_search").submit()
    false