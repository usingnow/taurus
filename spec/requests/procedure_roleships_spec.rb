require 'spec_helper'

describe "ProcedureRoleships" do
  describe "GET /procedure_roleships" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get procedure_roleships_path
      response.status.should be(200)
    end
  end
end
