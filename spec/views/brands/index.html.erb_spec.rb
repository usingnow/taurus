require 'spec_helper'

describe "brands/index.html.erb" do
  before(:each) do
    assign(:brands, [
      stub_model(Brand,
        :chinese_name => "Chinese Name",
        :english_name => "English Name",
        :pinyin => "Pinyin",
        :web_address => "",
        :company_introduction => "MyText",
        :image_url => "Image Url",
        :active => "",
        :update_by => "Update By"
      ),
      stub_model(Brand,
        :chinese_name => "Chinese Name",
        :english_name => "English Name",
        :pinyin => "Pinyin",
        :web_address => "",
        :company_introduction => "MyText",
        :image_url => "Image Url",
        :active => "",
        :update_by => "Update By"
      )
    ])
  end

  it "renders a list of brands" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Chinese Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "English Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pinyin".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Update By".to_s, :count => 2
  end
end
