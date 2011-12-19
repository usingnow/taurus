require 'spec_helper'

describe "person_extends/edit.html.erb" do
  before(:each) do
    @person_extend = assign(:person_extend, stub_model(PersonExtend,
      :person_no => "MyString",
      :role_no => "MyString",
      :email => "MyString",
      :name => "MyString",
      :sex => 1,
      :district_no => "MyString",
      :phone => "MyString",
      :address => "MyString",
      :post => "MyString",
      :created_by => "MyString",
      :updated_by => "MyString"
    ))
  end

  it "renders the edit person_extend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => person_extends_path(@person_extend), :method => "post" do
      assert_select "input#person_extend_person_no", :name => "person_extend[person_no]"
      assert_select "input#person_extend_role_no", :name => "person_extend[role_no]"
      assert_select "input#person_extend_email", :name => "person_extend[email]"
      assert_select "input#person_extend_name", :name => "person_extend[name]"
      assert_select "input#person_extend_sex", :name => "person_extend[sex]"
      assert_select "input#person_extend_district_no", :name => "person_extend[district_no]"
      assert_select "input#person_extend_phone", :name => "person_extend[phone]"
      assert_select "input#person_extend_address", :name => "person_extend[address]"
      assert_select "input#person_extend_post", :name => "person_extend[post]"
      assert_select "input#person_extend_created_by", :name => "person_extend[created_by]"
      assert_select "input#person_extend_updated_by", :name => "person_extend[updated_by]"
    end
  end
end
