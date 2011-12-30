require "spec_helper"

describe PurchasesController do
  describe "routing" do

    it "routes to #index" do
      get("/purchases").should route_to("purchases#index")
    end

    it "routes to #new" do
      get("/purchases/new").should route_to("purchases#new")
    end

    it "routes to #show" do
      get("/purchases/1").should route_to("purchases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/purchases/1/edit").should route_to("purchases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/purchases").should route_to("purchases#create")
    end

    it "routes to #update" do
      put("/purchases/1").should route_to("purchases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/purchases/1").should route_to("purchases#destroy", :id => "1")
    end

  end
end
