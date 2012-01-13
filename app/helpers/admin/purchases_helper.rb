#encoding:UTF-8
module Admin::PurchasesHelper
  def format_purchase_status(value)
   if value == 0
     "新增"
   elsif value == 1
     "待入库"
   end
  end

  def next_purchase_status(purchase)
    if purchase.status == 0
      next_status = 1
      confirm = "确定进入待入库状态么？"
    else
      next_status = 2
      confirm = ""
    end

    link_to '下一步', next_admin_purchases_path(purchase,:status => next_status), :confirm => confirm, :method => :put
  end
end
