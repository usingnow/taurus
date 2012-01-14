require 'spec_helper'

describe "prod_del_ordships/show.html.erb" do
  before(:each) do
    @prod_del_ordship = assign(:prod_del_ordship, stub_model(ProdDelOrdship,
      :delivery_order_id => 1,
      :product_id => 1,
      :quantity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
