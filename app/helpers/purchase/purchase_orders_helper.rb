#encoding:UTF-8
module Purchase::PurchaseOrdersHelper
  def format_po_status(value)
    { 0 => "保存", 1 => "已发布", 2 => "已关闭" }[value]
  end

  def format_po_store_status(value)
    { false => "待入库", true => "已入库" }[value]
  end

  def purchase_order_operating(object)
    html = ''
    if object.po_status == 0
      html = link_to "修改", edit_purchase_purchase_order_path(object.id)
      html += link_to "关闭", purchase_purchase_order_path(object.id), :confirm => "确定关闭采购单么？", :method => :delete
    elsif object.po_status == 1
      html = link_to "打印"
      html += link_to "修改", released_edit_purchase_purchase_order_path(object.id)
      html += link_to "关闭", purchase_purchase_order_path(object.id), :confirm => "确定关闭采购单么？", :method => :delete
    elsif object.po_status == 2
      html = link_to "打印"
    end
    html.html_safe
  end
end