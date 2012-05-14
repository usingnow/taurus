require 'spec_helper'

describe Taurus::ProductCategory do

  context "validation" do

    it { should validate_presence_of(:number) }

    it { should validate_presence_of(:name) }

    it { 
      Taurus::ProductCategory.create!(:number => 01, :name => "test")
      should validate_uniqueness_of(:number) 
    }

  end
end

