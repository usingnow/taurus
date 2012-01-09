require 'spec_helper'

describe "company_scales/show.html.erb" do
  before(:each) do
    @company_scale = assign(:company_scale, stub_model(CompanyScale,
      :name => "Name",
      :sequence => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
