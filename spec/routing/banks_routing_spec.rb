require "spec_helper"

describe BanksController do
  describe "routing" do

    it "routes to #index" do
      get("/banks").should route_to("banks#index")
    end

    it "routes to #new" do
      get("/banks/new").should route_to("banks#new")
    end

    it "routes to #show" do
      get("/banks/1").should route_to("banks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/banks/1/edit").should route_to("banks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/banks").should route_to("banks#create")
    end

    it "routes to #update" do
      put("/banks/1").should route_to("banks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/banks/1").should route_to("banks#destroy", :id => "1")
    end

  end
end
