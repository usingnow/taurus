#encoding:UTF-8
require 'spec_helper'

describe Procedure do
  it "when procedure is save" do
     @procedure = Procedure.new
     @procedure.invalid?
     @procedure.errors.size.should == 3
     @procedure.errors[:name].should == [I18n.t('errors.messages.blank')]
     @procedure.errors[:display_name].should == [I18n.t('errors.messages.blank')]
     @procedure.errors[:sequence].should == [I18n.t('errors.messages.not_an_integer')]
  end
end
