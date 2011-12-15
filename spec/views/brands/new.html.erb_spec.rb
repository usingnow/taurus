require 'spec_helper'

describe "brands/new.html.erb" do
  before(:each) do
    assign(:brand, stub_model(Brand,
      :chinese_name => "MyString",
      :english_name => "MyString",
      :pinyin => "MyString",
      :web_address => "",
      :company_introduction => "MyText",
      :image_url => "MyString",
      :active => "",
      :update_by => "MyString"
    ).as_new_record)
  end

  it "renders new brand form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => brands_path, :method => "post" do
      assert_select "input#brand_chinese_name", :name => "brand[chinese_name]"
      assert_select "input#brand_english_name", :name => "brand[english_name]"
      assert_select "input#brand_pinyin", :name => "brand[pinyin]"
      assert_select "input#brand_web_address", :name => "brand[web_address]"
      assert_select "textarea#brand_company_introduction", :name => "brand[company_introduction]"
      assert_select "input#brand_image_url", :name => "brand[image_url]"
      assert_select "input#brand_active", :name => "brand[active]"
      assert_select "input#brand_update_by", :name => "brand[update_by]"
    end
  end
end
