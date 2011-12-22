require 'spec_helper'

describe "procedures/edit.html.erb" do
  before(:each) do
    @procedure = assign(:procedure, stub_model(Procedure,
      :name => "MyString",
      :display_name => "MyString",
      :active => false,
      :sequence => 1
    ))
  end

  it "renders the edit procedure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => procedures_path(@procedure), :method => "post" do
      assert_select "input#procedure_name", :name => "procedure[name]"
      assert_select "input#procedure_display_name", :name => "procedure[display_name]"
      assert_select "input#procedure_active", :name => "procedure[active]"
      assert_select "input#procedure_sequence", :name => "procedure[sequence]"
    end
  end
end
