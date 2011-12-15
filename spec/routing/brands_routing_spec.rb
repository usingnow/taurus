require "spec_helper"

describe BrandsController do
  describe "routing" do

    it "routes to #index" do
      get("/brands").should route_to("brands#index")
    end

    it "routes to #new" do
      get("/brands/new").should route_to("brands#new")
    end

    it "routes to #show" do
      get("/brands/1").should route_to("brands#show", :id => "1")
    end

    it "routes to #edit" do
      get("/brands/1/edit").should route_to("brands#edit", :id => "1")
    end

    it "routes to #create" do
      post("/brands").should route_to("brands#create")
    end

    it "routes to #update" do
      put("/brands/1").should route_to("brands#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/brands/1").should route_to("brands#destroy", :id => "1")
    end

  end
end
