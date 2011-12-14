require 'spec_helper'

describe "suppliers/show.html.erb" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :name => "Name",
      :input_person => "Input Person",
      :contact_name => "Contact Name",
      :contact_way => "Contact Way",
      :terms_of_exchange => "Terms Of Exchange",
      :delivery => "Delivery",
      :level => "Level",
      :active => false,
      :create_by => "Create By",
      :update_by => "Update By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Input Person/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Way/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Terms Of Exchange/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Delivery/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Level/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Create By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Update By/)
  end
end
