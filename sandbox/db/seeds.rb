#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
Condition.delete_all
Condition.create(
  :name=>"是"
)
Condition.create(
  :name=>"否"
)
Condition.create(
  :name=>"内部修改订单"
)
Condition.create(
  :name=>"内部取消订单"
)
Condition.create(
  :name=>"内部确认订单"
)
Condition.create(
  :name=>"内部拣货出库"
)
Condition.create(
  :name=>"内部签收"
)
Condition.create(
  :name=>"内部解除订单保留"
)
Condition.create(
  :name=>"内部输入人付款信息"
)
Condition.create(
  :name=>"内部手动保留订单"
)
Condition.create(
  :name=>"内部设置在线已支付"
)
Condition.create(
  :name=>"客户修改订单"
)
Condition.create(
  :name=>"客户取消订单"
)
Condition.create(
  :name=>"客户付款"
)
Condition.create(
  :name=>"客户输入转账汇款信息"
)
Condition.create(
  :name=>"客户产看订单详情"
)

BusinessFunction.delete_all
BusinessFunction.create(
  :name=>"订单和流程实例关联",
  :function=>"SetOrderInstanceId"
)
BusinessFunction.create(
  :name=>"设置付款状态为已付款",
  :function=>"SetPayCompleted"
)
BusinessFunction.create(
  :name=>"减库存",
  :function=>"DeductWarehouseValue"
)
BusinessFunction.create(
  :name=>"加库存",
  :function=>"RestoreWarehouseValue"
)
BusinessFunction.create(
  :name=>"累加销售总量",
  :function=>"IncreaseTotalSale"
)
















