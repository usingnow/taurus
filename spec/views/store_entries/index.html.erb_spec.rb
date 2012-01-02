require 'spec_helper'

describe "store_entries/index.html.erb" do
  before(:each) do
    assign(:store_entries, [
      stub_model(StoreEntry,
        :number => "Number",
        :purchase_id => 1,
        :ordering_company_id => 1,
        :supplier_id => 1,
        :store_id => 1,
        :note => "MyText"
      ),
      stub_model(StoreEntry,
        :number => "Number",
        :purchase_id => 1,
        :ordering_company_id => 1,
        :supplier_id => 1,
        :store_id => 1,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of store_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
