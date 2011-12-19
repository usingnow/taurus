require 'spec_helper'

describe "person_extends/index.html.erb" do
  before(:each) do
    assign(:person_extends, [
      stub_model(PersonExtend,
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
      ),
      stub_model(PersonExtend,
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
      )
    ])
  end

  it "renders a list of person_extends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Person No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Role No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "District No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Post".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
