require "spec_helper"

describe EscCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/esc_categories").should route_to("esc_categories#index")
    end

    it "routes to #new" do
      get("/esc_categories/new").should route_to("esc_categories#new")
    end

    it "routes to #show" do
      get("/esc_categories/1").should route_to("esc_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/esc_categories/1/edit").should route_to("esc_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/esc_categories").should route_to("esc_categories#create")
    end

    it "routes to #update" do
      put("/esc_categories/1").should route_to("esc_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/esc_categories/1").should route_to("esc_categories#destroy", :id => "1")
    end

  end
end
