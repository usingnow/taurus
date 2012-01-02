require 'spec_helper'

describe "stores/index.html.erb" do
  before(:each) do
    assign(:stores, [
      stub_model(Store,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Store,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of stores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
