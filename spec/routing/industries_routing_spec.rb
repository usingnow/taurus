require "spec_helper"

describe IndustriesController do
  describe "routing" do

    it "routes to #index" do
      get("/industries").should route_to("industries#index")
    end

    it "routes to #new" do
      get("/industries/new").should route_to("industries#new")
    end

    it "routes to #show" do
      get("/industries/1").should route_to("industries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/industries/1/edit").should route_to("industries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/industries").should route_to("industries#create")
    end

    it "routes to #update" do
      put("/industries/1").should route_to("industries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/industries/1").should route_to("industries#destroy", :id => "1")
    end

  end
end
