require 'spec_helper'

describe "purchases/show.html.erb" do
  before(:each) do
    @purchase = assign(:purchase, stub_model(Purchase,
      :number => "Number",
      :ordering_company_id => 1,
      :status => 1,
      :note => "MyText",
      :supplier_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
