require 'spec_helper'

describe "roles/new.html.erb" do
  before(:each) do
    assign(:role, stub_model(Role,
      :number => "MyString",
      :name => "MyString",
      :description => "MyString",
      :is_reserve => false
    ).as_new_record)
  end

  it "renders new role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roles_path, :method => "post" do
      assert_select "input#role_number", :name => "role[number]"
      assert_select "input#role_name", :name => "role[name]"
      assert_select "input#role_description", :name => "role[description]"
      assert_select "input#role_is_reserve", :name => "role[is_reserve]"
    end
  end
end
