#encoding:UTF-8
require 'spec_helper'

describe Sku do
  describe "category_skus" do
    it "返回一个结果集" do
      Sku.category_skus("0111").should_not be_empty
      Sku.category_hots("0111").should_not be_empty
    end

    it "返回一个空的结果集" do
      Sku.category_skus("number").should be_empty
      Sku.category_hots("number").should be_empty
    end
  end
end