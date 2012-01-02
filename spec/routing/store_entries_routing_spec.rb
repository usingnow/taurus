require "spec_helper"

describe StoreEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/store_entries").should route_to("store_entries#index")
    end

    it "routes to #new" do
      get("/store_entries/new").should route_to("store_entries#new")
    end

    it "routes to #show" do
      get("/store_entries/1").should route_to("store_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/store_entries/1/edit").should route_to("store_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/store_entries").should route_to("store_entries#create")
    end

    it "routes to #update" do
      put("/store_entries/1").should route_to("store_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/store_entries/1").should route_to("store_entries#destroy", :id => "1")
    end

  end
end
