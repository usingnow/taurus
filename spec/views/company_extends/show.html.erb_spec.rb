require 'spec_helper'

describe "company_extends/show.html.erb" do
  before(:each) do
    @company_extend = assign(:company_extend, stub_model(CompanyExtend,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/District No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Dept/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Post/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Web Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fax/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mobile/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zip/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Created By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Updated By/)
  end
end
