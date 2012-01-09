require 'spec_helper'

describe "company_types/show.html.erb" do
  before(:each) do
    @company_type = assign(:company_type, stub_model(CompanyType,
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
