require 'spec_helper'

describe "company_extends/new.html.erb" do
  before(:each) do
    assign(:company_extend, stub_model(CompanyExtend,
      :user_id => 1,
      :company_no => "MyString",
      :role_no => "MyString",
      :industry_type_id => 1,
      :company_type_id => 1,
      :district_no => "MyString",
      :company_scale_id => 1,
      :email => "MyString",
      :company_name => "MyString",
      :contact_dept => "MyString",
      :contact_post => "MyString",
      :web_address => "MyString",
      :sex => 1,
      :name => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :mobile => "MyString",
      :zip => "MyString",
      :created_by => "MyString",
      :updated_by => "MyString"
    ).as_new_record)
  end

  it "renders new company_extend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => company_extends_path, :method => "post" do
      assert_select "input#company_extend_user_id", :name => "company_extend[user_id]"
      assert_select "input#company_extend_company_no", :name => "company_extend[company_no]"
      assert_select "input#company_extend_role_no", :name => "company_extend[role_no]"
      assert_select "input#company_extend_industry_type_id", :name => "company_extend[industry_type_id]"
      assert_select "input#company_extend_company_type_id", :name => "company_extend[company_type_id]"
      assert_select "input#company_extend_district_no", :name => "company_extend[district_no]"
      assert_select "input#company_extend_company_scale_id", :name => "company_extend[company_scale_id]"
      assert_select "input#company_extend_email", :name => "company_extend[email]"
      assert_select "input#company_extend_company_name", :name => "company_extend[company_name]"
      assert_select "input#company_extend_contact_dept", :name => "company_extend[contact_dept]"
      assert_select "input#company_extend_contact_post", :name => "company_extend[contact_post]"
      assert_select "input#company_extend_web_address", :name => "company_extend[web_address]"
      assert_select "input#company_extend_sex", :name => "company_extend[sex]"
      assert_select "input#company_extend_name", :name => "company_extend[name]"
      assert_select "input#company_extend_address", :name => "company_extend[address]"
      assert_select "input#company_extend_phone", :name => "company_extend[phone]"
      assert_select "input#company_extend_fax", :name => "company_extend[fax]"
      assert_select "input#company_extend_mobile", :name => "company_extend[mobile]"
      assert_select "input#company_extend_zip", :name => "company_extend[zip]"
      assert_select "input#company_extend_created_by", :name => "company_extend[created_by]"
      assert_select "input#company_extend_updated_by", :name => "company_extend[updated_by]"
    end
  end
end
