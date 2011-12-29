require 'spec_helper'

describe "escs/new.html.erb" do
  before(:each) do
    assign(:esc, stub_model(Esc,
      :number => "MyString",
      :esc_category_id => 1,
      :user_id => 1,
      :status => 1,
      :order_id => 1,
      :not_registration_user_info => "MyString",
      :user_other_info => "MyString",
      :title => "MyString",
      :description => "MyText",
      :created_by => 1
    ).as_new_record)
  end

  it "renders new esc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => escs_path, :method => "post" do
      assert_select "input#esc_number", :name => "esc[number]"
      assert_select "input#esc_esc_category_id", :name => "esc[esc_category_id]"
      assert_select "input#esc_user_id", :name => "esc[user_id]"
      assert_select "input#esc_status", :name => "esc[status]"
      assert_select "input#esc_order_id", :name => "esc[order_id]"
      assert_select "input#esc_not_registration_user_info", :name => "esc[not_registration_user_info]"
      assert_select "input#esc_user_other_info", :name => "esc[user_other_info]"
      assert_select "input#esc_title", :name => "esc[title]"
      assert_select "textarea#esc_description", :name => "esc[description]"
      assert_select "input#esc_created_by", :name => "esc[created_by]"
    end
  end
end
