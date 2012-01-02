require 'spec_helper'

describe "store_entries/new.html.erb" do
  before(:each) do
    assign(:store_entry, stub_model(StoreEntry,
      :number => "MyString",
      :purchase_id => 1,
      :ordering_company_id => 1,
      :supplier_id => 1,
      :store_id => 1,
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new store_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => store_entries_path, :method => "post" do
      assert_select "input#store_entry_number", :name => "store_entry[number]"
      assert_select "input#store_entry_purchase_id", :name => "store_entry[purchase_id]"
      assert_select "input#store_entry_ordering_company_id", :name => "store_entry[ordering_company_id]"
      assert_select "input#store_entry_supplier_id", :name => "store_entry[supplier_id]"
      assert_select "input#store_entry_store_id", :name => "store_entry[store_id]"
      assert_select "textarea#store_entry_note", :name => "store_entry[note]"
    end
  end
end
