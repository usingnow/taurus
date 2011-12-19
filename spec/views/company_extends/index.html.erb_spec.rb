require 'spec_helper'

describe "company_extends/index.html.erb" do
  before(:each) do
    assign(:company_extends, [
      stub_model(CompanyExtend,
        :user_id => 1,
        :company_no => "Company No",
        :role_no => "Role No",
        :industry_type_id => 1,
        :company_type_id => 1,
        :district_no => "District No",
        :company_scale_id => 1,
        :email => "Email",
        :company_name => "Company Name",
        :contact_dept => "Contact Dept",
        :contact_post => "Contact Post",
        :web_address => "Web Address",
        :sex => 1,
        :name => "Name",
        :address => "Address",
        :phone => "Phone",
        :fax => "Fax",
        :mobile => "Mobile",
        :zip => "Zip",
        :created_by => "Created By",
        :updated_by => "Updated By"
      ),
      stub_model(CompanyExtend,
        :user_id => 1,
        :company_no => "Company No",
        :role_no => "Role No",
        :industry_type_id => 1,
        :company_type_id => 1,
        :district_no => "District No",
        :company_scale_id => 1,
        :email => "Email",
        :company_name => "Company Name",
        :contact_dept => "Contact Dept",
        :contact_post => "Contact Post",
        :web_address => "Web Address",
        :sex => 1,
        :name => "Name",
        :address => "Address",
        :phone => "Phone",
        :fax => "Fax",
        :mobile => "Mobile",
        :zip => "Zip",
        :created_by => "Created By",
        :updated_by => "Updated By"
      )
    ])
  end

  it "renders a list of company_extends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Role No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "District No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Dept".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Post".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Web Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
