require "spec_helper"

describe SkuImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/sku_images").should route_to("sku_images#index")
    end

    it "routes to #new" do
      get("/sku_images/new").should route_to("sku_images#new")
    end

    it "routes to #show" do
      get("/sku_images/1").should route_to("sku_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sku_images/1/edit").should route_to("sku_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sku_images").should route_to("sku_images#create")
    end

    it "routes to #update" do
      put("/sku_images/1").should route_to("sku_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sku_images/1").should route_to("sku_images#destroy", :id => "1")
    end

  end
end
