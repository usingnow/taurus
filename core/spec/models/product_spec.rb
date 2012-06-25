require 'spec_helper'

describe Taurus::Product do
  
  context "validation" do

    it { should have_valid_factory(:product) }

  end
end

