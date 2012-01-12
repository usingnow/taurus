require 'spec_helper'

describe "panic_buyings/index.html.erb" do
  before(:each) do
    assign(:panic_buyings, [
      stub_model(PanicBuying,
        :name => "Name",
        :href => "Href"
      ),
      stub_model(PanicBuying,
        :name => "Name",
        :href => "Href"
      )
    ])
  end

  it "renders a list of panic_buyings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Href".to_s, :count => 2
  end
end
