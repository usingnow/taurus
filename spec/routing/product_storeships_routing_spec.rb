require "spec_helper"

describe ProductStoreshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_storeships").should route_to("product_storeships#index")
    end

    it "routes to #new" do
      get("/product_storeships/new").should route_to("product_storeships#new")
    end

    it "routes to #show" do
      get("/product_storeships/1").should route_to("product_storeships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_storeships/1/edit").should route_to("product_storeships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_storeships").should route_to("product_storeships#create")
    end

    it "routes to #update" do
      put("/product_storeships/1").should route_to("product_storeships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_storeships/1").should route_to("product_storeships#destroy", :id => "1")
    end

  end
end
