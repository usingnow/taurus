require 'spec_helper'

describe "skus/index.html.erb" do
  before(:each) do
    assign(:skus, [
      stub_model(Sku,
        :number => "Number",
        :name => "Name",
        :brand_id => 1,
        :sku_category_id => 1,
        :unit => "Unit",
        :specification => "Specification",
        :delivery_day => "Delivery Day",
        :type => 1,
        :model => "Model",
        :size => "Size",
        :delivery_description => "MyText",
        :can_return => false,
        :description => "MyText",
        :color => "Color",
        :can_on_be_half => false,
        :classifcation => 1,
        :is_integral => false,
        :integral => 1,
        :introduction => "MyText",
        :advertisement => "MyText",
        :status => 1,
        :sales_status => 1,
        :cost_bef_tax => "9.99",
        :cost_aft_tax => "9.99",
        :market_price => "9.99",
        :assembling_fee_bef_tax => "9.99",
        :assembling_fee_aft_tax => "9.99",
        :installation_cost_bef_tax => "9.99",
        :insatllation_cost_aft_tax => "9.99",
        :create_by => "Create By",
        :update_by => "Update By",
        :total_sale => 1
      ),
      stub_model(Sku,
        :number => "Number",
        :name => "Name",
        :brand_id => 1,
        :sku_category_id => 1,
        :unit => "Unit",
        :specification => "Specification",
        :delivery_day => "Delivery Day",
        :type => 1,
        :model => "Model",
        :size => "Size",
        :delivery_description => "MyText",
        :can_return => false,
        :description => "MyText",
        :color => "Color",
        :can_on_be_half => false,
        :classifcation => 1,
        :is_integral => false,
        :integral => 1,
        :introduction => "MyText",
        :advertisement => "MyText",
        :status => 1,
        :sales_status => 1,
        :cost_bef_tax => "9.99",
        :cost_aft_tax => "9.99",
        :market_price => "9.99",
        :assembling_fee_bef_tax => "9.99",
        :assembling_fee_aft_tax => "9.99",
        :installation_cost_bef_tax => "9.99",
        :insatllation_cost_aft_tax => "9.99",
        :create_by => "Create By",
        :update_by => "Update By",
        :total_sale => 1
      )
    ])
  end

  it "renders a list of skus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Specification".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Delivery Day".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Create By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Update By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
