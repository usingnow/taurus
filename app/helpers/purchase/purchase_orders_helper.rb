#encoding:UTF-8
module Purchase::PurchaseOrdersHelper
  def format_po_status(value)
    PurchaseOrder.po_status_enum[value]
  end

  def format_po_store_status(value)
    PurchaseOrder.po_store_status_enum[value]
  end

  def purchase_order_operating(object)
    html = ''
    if object.po_status == 0
      html = link_to "修改", edit_purchase_purchase_order_path(object.id), :target => "_blank"
      confirm = "确定关闭采购单么？"
      if object.po_store_status
        confirm = "素材商品采购数量与入库数量不一致，是否继续关闭采购单？" if object.purchase_amount != object.store_amount
      end
      html += link_to "关闭", purchase_purchase_order_path(object.id), :confirm => confirm, :method => :delete
    elsif object.po_status == 1
      html = link_to "打印", print_purchase_purchase_order_path(object.id), :target => "_blank"
      html += link_to "修改", released_edit_purchase_purchase_order_path(object.id), :target => "_blank"
      confirm = "确定关闭采购单么？"
      if object.po_store_status
        confirm = "素材商品采购数量与入库数量不一致，是否继续关闭采购单？" if object.purchase_amount != object.store_amount
      end
      html += link_to "关闭", purchase_purchase_order_path(object.id), :confirm => confirm, :method => :delete
    elsif object.po_status == 2
      html = link_to "打印", print_purchase_purchase_order_path(object.id), :target => "_blank"
    end
    html.html_safe
  end
end