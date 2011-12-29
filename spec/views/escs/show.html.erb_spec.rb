require 'spec_helper'

describe "escs/show.html.erb" do
  before(:each) do
    @esc = assign(:esc, stub_model(Esc,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Not Registration User Info/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Other Info/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
