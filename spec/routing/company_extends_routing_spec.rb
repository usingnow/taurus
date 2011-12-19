require "spec_helper"

describe CompanyExtendsController do
  describe "routing" do

    it "routes to #index" do
      get("/company_extends").should route_to("company_extends#index")
    end

    it "routes to #new" do
      get("/company_extends/new").should route_to("company_extends#new")
    end

    it "routes to #show" do
      get("/company_extends/1").should route_to("company_extends#show", :id => "1")
    end

    it "routes to #edit" do
      get("/company_extends/1/edit").should route_to("company_extends#edit", :id => "1")
    end

    it "routes to #create" do
      post("/company_extends").should route_to("company_extends#create")
    end

    it "routes to #update" do
      put("/company_extends/1").should route_to("company_extends#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/company_extends/1").should route_to("company_extends#destroy", :id => "1")
    end

  end
end
