#encoding:UTF-8
require 'spec_helper'

describe Commodity::SkusHelper do
  describe "#format_sku_type" do
    it "返回对应结果" do
      helper.format_sku_type(1).should == "在库品"
      helper.format_sku_type(2).should == "直送品"
      helper.format_sku_type(3).should == "非在库"
      helper.format_sku_type(4).should == "未定"
      helper.format_sku_type(5).should == "劳务费用"
    end
  end

  describe "#format_sku_status" do
    it "返回对应结果" do
      helper.format_sku_status(1).should == "开始销售"
      helper.format_sku_status(2).should == "暂停销售"
    end
  end

  describe "#format_sku_sales_status" do
    it "返回对应结果" do
      helper.format_sku_sales_status(0).should == "未上架"
      helper.format_sku_sales_status(1).should == "已上架"
    end
  end

  describe "get_sku_type" do
    it "结果不为nil" do
      order = Order.all.first
      helper.get_sku_type(order).should_not be_nil
    end

    it "结果为‘无’" do
      helper.get_sku_type(nil).should == "无"
    end
  end
end