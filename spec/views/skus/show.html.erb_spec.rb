require 'spec_helper'

describe "skus/show.html.erb" do
  before(:each) do
    @sku = assign(:sku, stub_model(Sku,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Specification/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Delivery Day/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Model/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Size/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Color/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Create By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Update By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
