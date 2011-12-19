require 'spec_helper'

describe "person_extends/show.html.erb" do
  before(:each) do
    @person_extend = assign(:person_extend, stub_model(PersonExtend,
      :person_no => "Person No",
      :role_no => "Role No",
      :email => "Email",
      :name => "Name",
      :sex => 1,
      :district_no => "District No",
      :phone => "Phone",
      :address => "Address",
      :post => "Post",
      :created_by => "Created By",
      :updated_by => "Updated By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Person No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/District No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Post/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Created By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Updated By/)
  end
end
