require 'spec_helper'

describe "carts/show.html.erb" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart))
  end

  it "renders attributes in <p>" do
    render
  end
end
