require "spec_helper"

describe CartSkushipsController do
  describe "routing" do

    it "routes to #index" do
      get("/cart_skuships").should route_to("cart_skuships#index")
    end

    it "routes to #new" do
      get("/cart_skuships/new").should route_to("cart_skuships#new")
    end

    it "routes to #show" do
      get("/cart_skuships/1").should route_to("cart_skuships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cart_skuships/1/edit").should route_to("cart_skuships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cart_skuships").should route_to("cart_skuships#create")
    end

    it "routes to #update" do
      put("/cart_skuships/1").should route_to("cart_skuships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cart_skuships/1").should route_to("cart_skuships#destroy", :id => "1")
    end

  end
end
