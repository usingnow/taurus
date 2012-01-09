require 'spec_helper'

describe "CompanyTypes" do
  describe "GET /company_types" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get company_types_path
      response.status.should be(200)
    end
  end
end
