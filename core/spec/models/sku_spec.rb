require 'spec_helper'

describe Taurus::Sku do

  context "validation" do

    it { should validate_presence_of(:number) }

    it { should validate_presence_of(:name) }

  end
end

