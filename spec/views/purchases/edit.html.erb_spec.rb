require 'spec_helper'

describe "purchases/edit.html.erb" do
  before(:each) do
    @purchase = assign(:purchase, stub_model(Purchase,
      :number => "MyString",
      :ordering_company_id => 1,
      :status => 1,
      :note => "MyText",
      :supplier_id => 1
    ))
  end

  it "renders the edit purchase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchases_path(@purchase), :method => "post" do
      assert_select "input#purchase_number", :name => "purchase[number]"
      assert_select "input#purchase_ordering_company_id", :name => "purchase[ordering_company_id]"
      assert_select "input#purchase_status", :name => "purchase[status]"
      assert_select "textarea#purchase_note", :name => "purchase[note]"
      assert_select "input#purchase_supplier_id", :name => "purchase[supplier_id]"
    end
  end
end
