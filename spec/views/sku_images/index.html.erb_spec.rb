require 'spec_helper'

describe "sku_images/index.html.erb" do
  before(:each) do
    assign(:sku_images, [
      stub_model(SkuImage,
        :sku_id => 1,
        :name => "Name",
        :image_url => "Image Url",
        :image_description => "MyText",
        :sort => 1,
        :is_main => false,
        :created_by => "Created By",
        :updated_by => "Updated By"
      ),
      stub_model(SkuImage,
        :sku_id => 1,
        :name => "Name",
        :image_url => "Image Url",
        :image_description => "MyText",
        :sort => 1,
        :is_main => false,
        :created_by => "Created By",
        :updated_by => "Updated By"
      )
    ])
  end

  it "renders a list of sku_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
