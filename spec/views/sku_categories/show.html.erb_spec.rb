require 'spec_helper'

describe "sku_categories/show.html.erb" do
  before(:each) do
    @sku_category = assign(:sku_category, stub_model(SkuCategory,
      :root_id => 1,
      :parent_in => 1,
      :number => "Number",
      :name => "Name",
      :description => "MyText",
      :is_show_in_navigation => false,
      :is_show_in_column => false,
      :active => false,
      :create_by => "Create By",
      :update_by => "Update By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Create By/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Update By/)
  end
end
