require "spec_helper"

describe Admin::StationsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/stations").should route_to("admin/stations#index")
    end

    it "routes to #new" do
      get("/admin/stations/new").should route_to("admin/stations#new")
    end

    it "routes to #show" do
      get("/admin/stations/1").should route_to("admin/stations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/stations/1/edit").should route_to("admin/stations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/stations").should route_to("admin/stations#create")
    end

    it "routes to #update" do
      put("/admin/stations/1").should route_to("admin/stations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/stations/1").should route_to("admin/stations#destroy", :id => "1")
    end

  end
end
