require 'spec_helper'

describe "ordering_companies/edit.html.erb" do
  before(:each) do
    @ordering_company = assign(:ordering_company, stub_model(OrderingCompany,
      :number => "MyString",
      :name => "MyString",
      :address => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit ordering_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ordering_companies_path(@ordering_company), :method => "post" do
      assert_select "input#ordering_company_number", :name => "ordering_company[number]"
      assert_select "input#ordering_company_name", :name => "ordering_company[name]"
      assert_select "input#ordering_company_address", :name => "ordering_company[address]"
      assert_select "input#ordering_company_phone", :name => "ordering_company[phone]"
    end
  end
end
