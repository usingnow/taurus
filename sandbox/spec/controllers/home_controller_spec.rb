#encoding:UTF-8
require 'spec_helper'

describe HomeController do
  describe "#index" do
    it "图片页面0是“首页”" do
      Image.new.page_enum[0].should == "首页"
    end
  end
end