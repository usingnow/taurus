require "spec_helper"

describe EscRepliesController do
  describe "routing" do

    it "routes to #index" do
      get("/esc_replies").should route_to("esc_replies#index")
    end

    it "routes to #new" do
      get("/esc_replies/new").should route_to("esc_replies#new")
    end

    it "routes to #show" do
      get("/esc_replies/1").should route_to("esc_replies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/esc_replies/1/edit").should route_to("esc_replies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/esc_replies").should route_to("esc_replies#create")
    end

    it "routes to #update" do
      put("/esc_replies/1").should route_to("esc_replies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/esc_replies/1").should route_to("esc_replies#destroy", :id => "1")
    end

  end
end
