require "spec_helper"

describe ProcedureRoleshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/procedure_roleships").should route_to("procedure_roleships#index")
    end

    it "routes to #new" do
      get("/procedure_roleships/new").should route_to("procedure_roleships#new")
    end

    it "routes to #show" do
      get("/procedure_roleships/1").should route_to("procedure_roleships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/procedure_roleships/1/edit").should route_to("procedure_roleships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/procedure_roleships").should route_to("procedure_roleships#create")
    end

    it "routes to #update" do
      put("/procedure_roleships/1").should route_to("procedure_roleships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/procedure_roleships/1").should route_to("procedure_roleships#destroy", :id => "1")
    end

  end
end
