require "spec_helper"

describe OrderDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/order_details").should route_to("order_details#index")
    end

    it "routes to #new" do
      get("/order_details/new").should route_to("order_details#new")
    end

    it "routes to #show" do
      get("/order_details/1").should route_to("order_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/order_details/1/edit").should route_to("order_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/order_details").should route_to("order_details#create")
    end

    it "routes to #update" do
      put("/order_details/1").should route_to("order_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/order_details/1").should route_to("order_details#destroy", :id => "1")
    end

  end
end
