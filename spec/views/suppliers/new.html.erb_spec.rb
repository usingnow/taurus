require 'spec_helper'

describe "suppliers/new.html.erb" do
  before(:each) do
    assign(:supplier, stub_model(Supplier,
      :name => "MyString",
      :input_person => "MyString",
      :contact_name => "MyString",
      :contact_way => "MyString",
      :terms_of_exchange => "MyString",
      :delivery => "MyString",
      :level => "MyString",
      :active => false,
      :create_by => "MyString",
      :update_by => "MyString"
    ).as_new_record)
  end

  it "renders new supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => suppliers_path, :method => "post" do
      assert_select "input#supplier_name", :name => "supplier[name]"
      assert_select "input#supplier_input_person", :name => "supplier[input_person]"
      assert_select "input#supplier_contact_name", :name => "supplier[contact_name]"
      assert_select "input#supplier_contact_way", :name => "supplier[contact_way]"
      assert_select "input#supplier_terms_of_exchange", :name => "supplier[terms_of_exchange]"
      assert_select "input#supplier_delivery", :name => "supplier[delivery]"
      assert_select "input#supplier_level", :name => "supplier[level]"
      assert_select "input#supplier_active", :name => "supplier[active]"
      assert_select "input#supplier_create_by", :name => "supplier[create_by]"
      assert_select "input#supplier_update_by", :name => "supplier[update_by]"
    end
  end
end
