require 'spec_helper'

describe "roles/show.html.erb" do
  before(:each) do
    @role = assign(:role, stub_model(Role,
      :number => "Number",
      :name => "Name",
      :description => "Description",
      :is_reserve => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
