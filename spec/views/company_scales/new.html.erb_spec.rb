require 'spec_helper'

describe "company_scales/new.html.erb" do
  before(:each) do
    assign(:company_scale, stub_model(CompanyScale,
      :name => "MyString",
      :sequence => 1
    ).as_new_record)
  end

  it "renders new company_scale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => company_scales_path, :method => "post" do
      assert_select "input#company_scale_name", :name => "company_scale[name]"
      assert_select "input#company_scale_sequence", :name => "company_scale[sequence]"
    end
  end
end
