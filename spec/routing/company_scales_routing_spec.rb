require "spec_helper"

describe CompanyScalesController do
  describe "routing" do

    it "routes to #index" do
      get("/company_scales").should route_to("company_scales#index")
    end

    it "routes to #new" do
      get("/company_scales/new").should route_to("company_scales#new")
    end

    it "routes to #show" do
      get("/company_scales/1").should route_to("company_scales#show", :id => "1")
    end

    it "routes to #edit" do
      get("/company_scales/1/edit").should route_to("company_scales#edit", :id => "1")
    end

    it "routes to #create" do
      post("/company_scales").should route_to("company_scales#create")
    end

    it "routes to #update" do
      put("/company_scales/1").should route_to("company_scales#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/company_scales/1").should route_to("company_scales#destroy", :id => "1")
    end

  end
end
