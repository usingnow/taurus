require 'spec_helper'

describe "sku_images/show.html.erb" do
  before(:each) do
    @sku_image = assign(:sku_image, stub_model(SkuImage,
      :sku_id => 1,
      :name => "Name",
      :image_url => "Image Url",
      :image_description => "MyText",
      :sort => 1,
      :is_main => false,
      :created_by => "Created By",
      :updated_by => "Updated By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Created By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Updated By/)
  end
end
