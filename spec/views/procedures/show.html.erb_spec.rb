require 'spec_helper'

describe "procedures/show.html.erb" do
  before(:each) do
    @procedure = assign(:procedure, stub_model(Procedure,
      :name => "Name",
      :display_name => "Display Name",
      :active => false,
      :sequence => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Display Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
