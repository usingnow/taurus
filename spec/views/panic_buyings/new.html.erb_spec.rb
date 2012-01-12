require 'spec_helper'

describe "panic_buyings/new.html.erb" do
  before(:each) do
    assign(:panic_buying, stub_model(PanicBuying,
      :name => "MyString",
      :href => "MyString"
    ).as_new_record)
  end

  it "renders new panic_buying form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => panic_buyings_path, :method => "post" do
      assert_select "input#panic_buying_name", :name => "panic_buying[name]"
      assert_select "input#panic_buying_href", :name => "panic_buying[href]"
    end
  end
end
