require 'spec_helper'

describe Taurus::Supplier do
  before(:each) do 
    @supplier = Taurus::Supplier.new(
      :number => rand(1000),
      :name => Faker::Company.name,
      :contact_name => Faker::NameCN.name,
      :contact_phone => Faker::PhoneNumber.phone_number,
      :terms_of_exchange => "",
      :delivery => "",
      :level => "",
      :status => true,
      :created_by => rand(100),
      :updated_by => rand(100)
    )
  end

  context "validation" do

    it { should validate_presence_of(:number) }

    it { 
      @supplier.save
      should validate_uniqueness_of(:number) 
    }
    
    it { should validate_presence_of(:name) }

    it { 
      @supplier.save
      should validate_uniqueness_of(:name) 
    }

    it { should validate_presence_of(:contact_name) }

    it { should validate_presence_of(:contact_phone) }

    it { should validate_presence_of(:created_by) }

    it { should validate_presence_of(:updated_by) }
    
  end
end

