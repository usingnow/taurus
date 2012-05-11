require 'spec_helper'

describe Taurus::Supplier do

  context "validation" do

    it { should validate_presence_of(:number) }

    it { should validate_uniqueness_of(:number) }
    
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:contact_name) }

    it { should validate_presence_of(:contact_phone) }

    it { should validate_presence_of(:created_by) }

    it { should validate_presence_of(:updated_by) }
    
  end
end

