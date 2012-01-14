require 'spec_helper'

describe "ProdDelOrdships" do
  describe "GET /prod_del_ordships" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get prod_del_ordships_path
      response.status.should be(200)
    end
  end
end
