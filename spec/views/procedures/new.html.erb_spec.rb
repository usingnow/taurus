require 'spec_helper'

describe "procedures/new.html.erb" do
  before(:each) do
    assign(:procedure, stub_model(Procedure,
      :name => "MyString",
      :display_name => "MyString",
      :active => false,
      :sequence => 1
    ).as_new_record)
  end

  it "renders new procedure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => procedures_path, :method => "post" do
      assert_select "input#procedure_name", :name => "procedure[name]"
      assert_select "input#procedure_display_name", :name => "procedure[display_name]"
      assert_select "input#procedure_active", :name => "procedure[active]"
      assert_select "input#procedure_sequence", :name => "procedure[sequence]"
    end
  end
end
