require "spec_helper"

describe ProductStoreEntryshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_store_entryships").should route_to("product_store_entryships#index")
    end

    it "routes to #new" do
      get("/product_store_entryships/new").should route_to("product_store_entryships#new")
    end

    it "routes to #show" do
      get("/product_store_entryships/1").should route_to("product_store_entryships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_store_entryships/1/edit").should route_to("product_store_entryships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_store_entryships").should route_to("product_store_entryships#create")
    end

    it "routes to #update" do
      put("/product_store_entryships/1").should route_to("product_store_entryships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_store_entryships/1").should route_to("product_store_entryships#destroy", :id => "1")
    end

  end
end
