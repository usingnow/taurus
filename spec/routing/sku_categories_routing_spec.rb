require "spec_helper"

describe SkuCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/sku_categories").should route_to("sku_categories#index")
    end

    it "routes to #new" do
      get("/sku_categories/new").should route_to("sku_categories#new")
    end

    it "routes to #show" do
      get("/sku_categories/1").should route_to("sku_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sku_categories/1/edit").should route_to("sku_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sku_categories").should route_to("sku_categories#create")
    end

    it "routes to #update" do
      put("/sku_categories/1").should route_to("sku_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sku_categories/1").should route_to("sku_categories#destroy", :id => "1")
    end

  end
end
