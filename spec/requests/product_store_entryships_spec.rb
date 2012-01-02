require 'spec_helper'

describe "ProductStoreEntryships" do
  describe "GET /product_store_entryships" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get product_store_entryships_path
      response.status.should be(200)
    end
  end
end
