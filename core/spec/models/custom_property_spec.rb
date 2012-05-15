require 'spec_helper'

describe Taurus::CustomProperty do

  context "validation" do

    it { should validate_presence_of(:product_category_id) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:property_type) }

  end
end

