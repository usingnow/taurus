require 'spec_helper'

describe "EscCategories" do
  describe "GET /esc_categories" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get esc_categories_path
      response.status.should be(200)
    end
  end
end
