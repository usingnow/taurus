require 'spec_helper'

describe "escs/index.html.erb" do
  before(:each) do
    assign(:escs, [
      stub_model(Esc,
        :number => "Number",
        :esc_category_id => 1,
        :user_id => 1,
        :status => 1,
        :order_id => 1,
        :not_registration_user_info => "Not Registration User Info",
        :user_other_info => "User Other Info",
        :title => "Title",
        :description => "MyText",
        :created_by => 1
      ),
      stub_model(Esc,
        :number => "Number",
        :esc_category_id => 1,
        :user_id => 1,
        :status => 1,
        :order_id => 1,
        :not_registration_user_info => "Not Registration User Info",
        :user_other_info => "User Other Info",
        :title => "Title",
        :description => "MyText",
        :created_by => 1
      )
    ])
  end

  it "renders a list of escs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Not Registration User Info".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Other Info".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
