require "spec_helper"

describe SkusController do
  describe "routing" do

    it "routes to #index" do
      get("/skus").should route_to("skus#index")
    end

    it "routes to #new" do
      get("/skus/new").should route_to("skus#new")
    end

    it "routes to #show" do
      get("/skus/1").should route_to("skus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/skus/1/edit").should route_to("skus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/skus").should route_to("skus#create")
    end

    it "routes to #update" do
      put("/skus/1").should route_to("skus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/skus/1").should route_to("skus#destroy", :id => "1")
    end

  end
end
