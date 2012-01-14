require "spec_helper"

describe DeliveryOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/delivery_orders").should route_to("delivery_orders#index")
    end

    it "routes to #new" do
      get("/delivery_orders/new").should route_to("delivery_orders#new")
    end

    it "routes to #show" do
      get("/delivery_orders/1").should route_to("delivery_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/delivery_orders/1/edit").should route_to("delivery_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/delivery_orders").should route_to("delivery_orders#create")
    end

    it "routes to #update" do
      put("/delivery_orders/1").should route_to("delivery_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/delivery_orders/1").should route_to("delivery_orders#destroy", :id => "1")
    end

  end
end
