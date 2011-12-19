require "spec_helper"

describe PersonExtendsController do
  describe "routing" do

    it "routes to #index" do
      get("/person_extends").should route_to("person_extends#index")
    end

    it "routes to #new" do
      get("/person_extends/new").should route_to("person_extends#new")
    end

    it "routes to #show" do
      get("/person_extends/1").should route_to("person_extends#show", :id => "1")
    end

    it "routes to #edit" do
      get("/person_extends/1/edit").should route_to("person_extends#edit", :id => "1")
    end

    it "routes to #create" do
      post("/person_extends").should route_to("person_extends#create")
    end

    it "routes to #update" do
      put("/person_extends/1").should route_to("person_extends#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/person_extends/1").should route_to("person_extends#destroy", :id => "1")
    end

  end
end
