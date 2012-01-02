require 'spec_helper'

describe "pick_ups/index.html.erb" do
  before(:each) do
    assign(:pick_ups, [
      stub_model(PickUp,
        :name => "Name",
        :href => "Href"
      ),
      stub_model(PickUp,
        :name => "Name",
        :href => "Href"
      )
    ])
  end

  it "renders a list of pick_ups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Href".to_s, :count => 2
  end
end
