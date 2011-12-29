require "spec_helper"

describe EscsController do
  describe "routing" do

    it "routes to #index" do
      get("/escs").should route_to("escs#index")
    end

    it "routes to #new" do
      get("/escs/new").should route_to("escs#new")
    end

    it "routes to #show" do
      get("/escs/1").should route_to("escs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/escs/1/edit").should route_to("escs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/escs").should route_to("escs#create")
    end

    it "routes to #update" do
      put("/escs/1").should route_to("escs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/escs/1").should route_to("escs#destroy", :id => "1")
    end

  end
end
