require 'spec_helper'

describe "suppliers/index.html.erb" do
  before(:each) do
    assign(:suppliers, [
      stub_model(Supplier,
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
      ),
      stub_model(Supplier,
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
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Input Person".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Way".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Terms Of Exchange".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Delivery".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Level".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Create By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Update By".to_s, :count => 2
  end
end
