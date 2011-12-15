require 'spec_helper'

describe "product_categories/new.html.erb" do
  before(:each) do
    assign(:product_category, stub_model(ProductCategory,
      :parent_id => "",
      :number => "MyString",
      :name => "MyString",
      :description => "MyText",
      :create_by => "MyString",
      :update_by => "MyString"
    ).as_new_record)
  end

  it "renders new product_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_categories_path, :method => "post" do
      assert_select "input#product_category_parent_id", :name => "product_category[parent_id]"
      assert_select "input#product_category_number", :name => "product_category[number]"
      assert_select "input#product_category_name", :name => "product_category[name]"
      assert_select "textarea#product_category_description", :name => "product_category[description]"
      assert_select "input#product_category_create_by", :name => "product_category[create_by]"
      assert_select "input#product_category_update_by", :name => "product_category[update_by]"
    end
  end
end
