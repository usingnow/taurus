require 'spec_helper'

describe "company_types/new.html.erb" do
  before(:each) do
    assign(:company_type, stub_model(CompanyType,
      :name => "MyString",
      :sequence => 1
    ).as_new_record)
  end

  it "renders new company_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => company_types_path, :method => "post" do
      assert_select "input#company_type_name", :name => "company_type[name]"
      assert_select "input#company_type_sequence", :name => "company_type[sequence]"
    end
  end
end
