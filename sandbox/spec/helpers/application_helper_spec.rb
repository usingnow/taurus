#encoding:UTF-8
require 'spec_helper'

describe ApplicationHelper do
  describe "#format value" do
    it "返回正确的结果" do
      hash = {1 => "a", 2 => "b"}
      helper.instance_eval{ format_value(1, hash).should == "a" }
    end

    it "返回结果为'无'" do
      hash = {1 => "a", 2 => "b"}
      helper.instance_eval{ format_value(3, hash).should == "无" }
      helper.instance_eval{ format_value(nil, hash).should == "无" }
    end
  end
end