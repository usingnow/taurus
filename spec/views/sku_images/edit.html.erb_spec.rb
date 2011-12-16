require 'spec_helper'

describe "sku_images/edit.html.erb" do
  before(:each) do
    @sku_image = assign(:sku_image, stub_model(SkuImage,
      :sku_id => 1,
      :name => "MyString",
      :image_url => "MyString",
      :image_description => "MyText",
      :sort => 1,
      :is_main => false,
      :created_by => "MyString",
      :updated_by => "MyString"
    ))
  end

  it "renders the edit sku_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sku_images_path(@sku_image), :method => "post" do
      assert_select "input#sku_image_sku_id", :name => "sku_image[sku_id]"
      assert_select "input#sku_image_name", :name => "sku_image[name]"
      assert_select "input#sku_image_image_url", :name => "sku_image[image_url]"
      assert_select "textarea#sku_image_image_description", :name => "sku_image[image_description]"
      assert_select "input#sku_image_sort", :name => "sku_image[sort]"
      assert_select "input#sku_image_is_main", :name => "sku_image[is_main]"
      assert_select "input#sku_image_created_by", :name => "sku_image[created_by]"
      assert_select "input#sku_image_updated_by", :name => "sku_image[updated_by]"
    end
  end
end
