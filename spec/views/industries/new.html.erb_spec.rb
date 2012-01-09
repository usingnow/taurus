require 'spec_helper'

describe "industries/new.html.erb" do
  before(:each) do
    assign(:industry, stub_model(Industry,
      :name => "MyString",
      :sequence => 1
    ).as_new_record)
  end

  it "renders new industry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => industries_path, :method => "post" do
      assert_select "input#industry_name", :name => "industry[name]"
      assert_select "input#industry_sequence", :name => "industry[sequence]"
    end
  end
end
