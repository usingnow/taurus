require 'spec_helper'

describe "skus/new.html.erb" do
  before(:each) do
    assign(:sku, stub_model(Sku,
      :number => "MyString",
      :name => "MyString",
      :brand_id => 1,
      :sku_category_id => 1,
      :unit => "MyString",
      :specification => "MyString",
      :delivery_day => "MyString",
      :type => 1,
      :model => "MyString",
      :size => "MyString",
      :delivery_description => "MyText",
      :can_return => false,
      :description => "MyText",
      :color => "MyString",
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
      :create_by => "MyString",
      :update_by => "MyString",
      :total_sale => 1
    ).as_new_record)
  end

  it "renders new sku form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => skus_path, :method => "post" do
      assert_select "input#sku_number", :name => "sku[number]"
      assert_select "input#sku_name", :name => "sku[name]"
      assert_select "input#sku_brand_id", :name => "sku[brand_id]"
      assert_select "input#sku_sku_category_id", :name => "sku[sku_category_id]"
      assert_select "input#sku_unit", :name => "sku[unit]"
      assert_select "input#sku_specification", :name => "sku[specification]"
      assert_select "input#sku_delivery_day", :name => "sku[delivery_day]"
      assert_select "input#sku_type", :name => "sku[type]"
      assert_select "input#sku_model", :name => "sku[model]"
      assert_select "input#sku_size", :name => "sku[size]"
      assert_select "textarea#sku_delivery_description", :name => "sku[delivery_description]"
      assert_select "input#sku_can_return", :name => "sku[can_return]"
      assert_select "textarea#sku_description", :name => "sku[description]"
      assert_select "input#sku_color", :name => "sku[color]"
      assert_select "input#sku_can_on_be_half", :name => "sku[can_on_be_half]"
      assert_select "input#sku_classifcation", :name => "sku[classifcation]"
      assert_select "input#sku_is_integral", :name => "sku[is_integral]"
      assert_select "input#sku_integral", :name => "sku[integral]"
      assert_select "textarea#sku_introduction", :name => "sku[introduction]"
      assert_select "textarea#sku_advertisement", :name => "sku[advertisement]"
      assert_select "input#sku_status", :name => "sku[status]"
      assert_select "input#sku_sales_status", :name => "sku[sales_status]"
      assert_select "input#sku_cost_bef_tax", :name => "sku[cost_bef_tax]"
      assert_select "input#sku_cost_aft_tax", :name => "sku[cost_aft_tax]"
      assert_select "input#sku_market_price", :name => "sku[market_price]"
      assert_select "input#sku_assembling_fee_bef_tax", :name => "sku[assembling_fee_bef_tax]"
      assert_select "input#sku_assembling_fee_aft_tax", :name => "sku[assembling_fee_aft_tax]"
      assert_select "input#sku_installation_cost_bef_tax", :name => "sku[installation_cost_bef_tax]"
      assert_select "input#sku_insatllation_cost_aft_tax", :name => "sku[insatllation_cost_aft_tax]"
      assert_select "input#sku_create_by", :name => "sku[create_by]"
      assert_select "input#sku_update_by", :name => "sku[update_by]"
      assert_select "input#sku_total_sale", :name => "sku[total_sale]"
    end
  end
end
