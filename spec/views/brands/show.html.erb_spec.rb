require 'spec_helper'

describe "brands/show.html.erb" do
  before(:each) do
    @brand = assign(:brand, stub_model(Brand,
      :chinese_name => "Chinese Name",
      :english_name => "English Name",
      :pinyin => "Pinyin",
      :web_address => "",
      :company_introduction => "MyText",
      :image_url => "Image Url",
      :active => "",
      :update_by => "Update By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Chinese Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/English Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pinyin/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Update By/)
  end
end
