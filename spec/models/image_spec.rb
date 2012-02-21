#encoding:UTF-8
require 'spec_helper'

describe Image do
  describe "page_enum" do
    it "返回一个数组" do
      image = Image.new
      image.page_enum.should_not be_empty
    end
  end

  describe "location_enum" do
    it "返回一个数组" do
      image = Image.new
      image.location_enum(0).should_not be_empty
    end
  end

  describe "validates" do
    it "无效的参数" do
      Image.new.should_not be_valid
    end

    it "有效的参数" do
      Image.new(:page => 0, :location => 0).should be_valid
    end
  end
end