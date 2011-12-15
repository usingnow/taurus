require 'spec_helper'

describe Supplier do

    before(:each) { @supplier = Supplier.new }
    subject { @supplier }
    it { should be_a_kind_of ActiveRecord::Base }

    context "when name is blank" do
      before { @supplier.name = "" and @supplier.save }
      subject { @supplier }
      it { should have(1).errors_on(:name) }
    end

    context "when name is not blank" do
      before { @supplier.name = "test" and @supplier.save }
      subject { @supplier }
      it { should have(0).errors_on(:name) }
    end

    context "when input_person is blank" do
      before { @supplier.input_person = "" and @supplier.save }
      subject { @supplier }
      it { should have(1).errors_on(:input_person) }
    end

    context "when input_person is not blank" do
      before { @supplier.input_person = "test" and @supplier.save }
      subject { @supplier }
      it { should have(0).errors_on(:input_person) }
    end

end
