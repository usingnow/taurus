require "spec_helper"

describe SkuProductshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/sku_productships").should route_to("sku_productships#index")
    end

    it "routes to #new" do
      get("/sku_productships/new").should route_to("sku_productships#new")
    end

    it "routes to #show" do
      get("/sku_productships/1").should route_to("sku_productships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sku_productships/1/edit").should route_to("sku_productships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sku_productships").should route_to("sku_productships#create")
    end

    it "routes to #update" do
      put("/sku_productships/1").should route_to("sku_productships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sku_productships/1").should route_to("sku_productships#destroy", :id => "1")
    end

  end
end
