require "spec_helper"

describe ProductPurchaseshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_purchaseships").should route_to("product_purchaseships#index")
    end

    it "routes to #new" do
      get("/product_purchaseships/new").should route_to("product_purchaseships#new")
    end

    it "routes to #show" do
      get("/product_purchaseships/1").should route_to("product_purchaseships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_purchaseships/1/edit").should route_to("product_purchaseships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_purchaseships").should route_to("product_purchaseships#create")
    end

    it "routes to #update" do
      put("/product_purchaseships/1").should route_to("product_purchaseships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_purchaseships/1").should route_to("product_purchaseships#destroy", :id => "1")
    end

  end
end
