require 'spec_helper'

describe "prod_del_ordships/index.html.erb" do
  before(:each) do
    assign(:prod_del_ordships, [
      stub_model(ProdDelOrdship,
        :delivery_order_id => 1,
        :product_id => 1,
        :quantity => 1
      ),
      stub_model(ProdDelOrdship,
        :delivery_order_id => 1,
        :product_id => 1,
        :quantity => 1
      )
    ])
  end

  it "renders a list of prod_del_ordships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
