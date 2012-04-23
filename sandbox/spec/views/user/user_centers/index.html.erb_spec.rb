#encoding:UTF-8
require 'spec_helper'

describe "user/user_centers/index.html.erb" do
  describe "i18n" do
    it "返回预期结果" do
      I18n.t('activerecord.attributes.order.number').should == "订单编号"
      I18n.t('activerecord.attributes.order.created_at').should == "下单日期"
      I18n.t('activerecord.attributes.order.name').should == "收货人"
      I18n.t('activerecord.attributes.order.procedure').should == "支付方式"
      I18n.t('activerecord.attributes.order.station').should == "订单状态"
      I18n.t('operating').should == "操作"
    end
  end

  describe "orders" do

  end
end