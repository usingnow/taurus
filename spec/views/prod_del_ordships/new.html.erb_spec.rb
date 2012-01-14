require 'spec_helper'

describe "prod_del_ordships/new.html.erb" do
  before(:each) do
    assign(:prod_del_ordship, stub_model(ProdDelOrdship,
      :delivery_order_id => 1,
      :product_id => 1,
      :quantity => 1
    ).as_new_record)
  end

  it "renders new prod_del_ordship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prod_del_ordships_path, :method => "post" do
      assert_select "input#prod_del_ordship_delivery_order_id", :name => "prod_del_ordship[delivery_order_id]"
      assert_select "input#prod_del_ordship_product_id", :name => "prod_del_ordship[product_id]"
      assert_select "input#prod_del_ordship_quantity", :name => "prod_del_ordship[quantity]"
    end
  end
end
