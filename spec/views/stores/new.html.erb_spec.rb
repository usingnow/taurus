require 'spec_helper'

describe "stores/new.html.erb" do
  before(:each) do
    assign(:store, stub_model(Store,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stores_path, :method => "post" do
      assert_select "input#store_name", :name => "store[name]"
      assert_select "input#store_description", :name => "store[description]"
    end
  end
end
