require 'spec_helper'

describe Taurus::Brand do

  context "validation" do

    it { should validate_presence_of(:chinese_name) }

    it { should validate_presence_of(:english_name) }

    it { should validate_presence_of(:company_name) }

    it { should validate_presence_of(:created_by) }

    it { should validate_presence_of(:updated_by) }
    
  end
end

