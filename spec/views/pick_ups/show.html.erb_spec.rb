require 'spec_helper'

describe "pick_ups/show.html.erb" do
  before(:each) do
    @pick_up = assign(:pick_up, stub_model(PickUp,
      :name => "Name",
      :href => "Href"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Href/)
  end
end
