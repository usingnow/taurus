require 'spec_helper'

describe "panic_buyings/show.html.erb" do
  before(:each) do
    @panic_buying = assign(:panic_buying, stub_model(PanicBuying,
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
