require 'spec_helper'

describe "purchases/index.html.erb" do
  before(:each) do
    assign(:purchases, [
      stub_model(Purchase,
        :number => "Number",
        :ordering_company_id => 1,
        :status => 1,
        :note => "MyText",
        :supplier_id => 1
      ),
      stub_model(Purchase,
        :number => "Number",
        :ordering_company_id => 1,
        :status => 1,
        :note => "MyText",
        :supplier_id => 1
      )
    ])
  end

  it "renders a list of purchases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
