require 'spec_helper'

describe Station do
  it "when station is save" do
     @station = Station.new
     @station.invalid?
     @station.errors.size.should == 4
     @station.errors[:name].should == [I18n.t('errors.messages.blank')]
     @station.errors[:display_name].should == [I18n.t('errors.messages.blank')]
     @station.errors[:sequence].should == [I18n.t('errors.messages.not_an_integer')]
     @station.errors[:safe_quantity].should == [I18n.t('errors.messages.not_an_integer')]
  end
end
