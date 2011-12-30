require "spec_helper"

describe OrderingCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/ordering_companies").should route_to("ordering_companies#index")
    end

    it "routes to #new" do
      get("/ordering_companies/new").should route_to("ordering_companies#new")
    end

    it "routes to #show" do
      get("/ordering_companies/1").should route_to("ordering_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ordering_companies/1/edit").should route_to("ordering_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ordering_companies").should route_to("ordering_companies#create")
    end

    it "routes to #update" do
      put("/ordering_companies/1").should route_to("ordering_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ordering_companies/1").should route_to("ordering_companies#destroy", :id => "1")
    end

  end
end
