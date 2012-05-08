#encoding:UTF-8
require 'spec_helper'

describe Content::ImagesHelper do
  describe "#get_image_page" do
    it "获得正确结果" do
      helper.instance_eval{ get_image_page(0).should == "首页" }
    end
  end

  describe "#get_image_location" do
    it "获得正确结果" do
      helper.instance_eval{ get_image_location(0,0).should == "一" }
    end
  end

end