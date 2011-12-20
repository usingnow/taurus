require 'spec_helper'

describe "order_details/new.html.erb" do
  before(:each) do
    assign(:order_detail, stub_model(OrderDetail,
      :order_id => 1,
      :sku_id => 1,
      :unit_price => "9.99",
      :quantity => 1,
      :is_need_install => 1,
      :install_cost => "9.99",
      :is_need_assemble => 1,
      :assemble_cost => "9.99",
      :other_cost => "9.99",
      :created_admin_id => 1,
      :updated_admin_id => 1
    ).as_new_record)
  end

  it "renders new order_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => order_details_path, :method => "post" do
      assert_select "input#order_detail_order_id", :name => "order_detail[order_id]"
      assert_select "input#order_detail_sku_id", :name => "order_detail[sku_id]"
      assert_select "input#order_detail_unit_price", :name => "order_detail[unit_price]"
      assert_select "input#order_detail_quantity", :name => "order_detail[quantity]"
      assert_select "input#order_detail_is_need_install", :name => "order_detail[is_need_install]"
      assert_select "input#order_detail_install_cost", :name => "order_detail[install_cost]"
      assert_select "input#order_detail_is_need_assemble", :name => "order_detail[is_need_assemble]"
      assert_select "input#order_detail_assemble_cost", :name => "order_detail[assemble_cost]"
      assert_select "input#order_detail_other_cost", :name => "order_detail[other_cost]"
      assert_select "input#order_detail_created_admin_id", :name => "order_detail[created_admin_id]"
      assert_select "input#order_detail_updated_admin_id", :name => "order_detail[updated_admin_id]"
    end
  end
end
