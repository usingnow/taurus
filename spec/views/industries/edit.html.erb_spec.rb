require 'spec_helper'

describe "industries/edit.html.erb" do
  before(:each) do
    @industry = assign(:industry, stub_model(Industry,
      :name => "MyString",
      :sequence => 1
    ))
  end

  it "renders the edit industry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => industries_path(@industry), :method => "post" do
      assert_select "input#industry_name", :name => "industry[name]"
      assert_select "input#industry_sequence", :name => "industry[sequence]"
    end
  end
end
