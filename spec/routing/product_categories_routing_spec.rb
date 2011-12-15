require "spec_helper"

describe ProductCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_categories").should route_to("product_categories#index")
    end

    it "routes to #new" do
      get("/product_categories/new").should route_to("product_categories#new")
    end

    it "routes to #show" do
      get("/product_categories/1").should route_to("product_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_categories/1/edit").should route_to("product_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_categories").should route_to("product_categories#create")
    end

    it "routes to #update" do
      put("/product_categories/1").should route_to("product_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_categories/1").should route_to("product_categories#destroy", :id => "1")
    end

  end
end
