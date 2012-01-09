require "spec_helper"

describe CompanyTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/company_types").should route_to("company_types#index")
    end

    it "routes to #new" do
      get("/company_types/new").should route_to("company_types#new")
    end

    it "routes to #show" do
      get("/company_types/1").should route_to("company_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/company_types/1/edit").should route_to("company_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/company_types").should route_to("company_types#create")
    end

    it "routes to #update" do
      put("/company_types/1").should route_to("company_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/company_types/1").should route_to("company_types#destroy", :id => "1")
    end

  end
end
