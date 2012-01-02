require "spec_helper"

describe PickUpsController do
  describe "routing" do

    it "routes to #index" do
      get("/pick_ups").should route_to("pick_ups#index")
    end

    it "routes to #new" do
      get("/pick_ups/new").should route_to("pick_ups#new")
    end

    it "routes to #show" do
      get("/pick_ups/1").should route_to("pick_ups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pick_ups/1/edit").should route_to("pick_ups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pick_ups").should route_to("pick_ups#create")
    end

    it "routes to #update" do
      put("/pick_ups/1").should route_to("pick_ups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pick_ups/1").should route_to("pick_ups#destroy", :id => "1")
    end

  end
end
