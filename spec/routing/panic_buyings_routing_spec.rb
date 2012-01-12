require "spec_helper"

describe PanicBuyingsController do
  describe "routing" do

    it "routes to #index" do
      get("/panic_buyings").should route_to("panic_buyings#index")
    end

    it "routes to #new" do
      get("/panic_buyings/new").should route_to("panic_buyings#new")
    end

    it "routes to #show" do
      get("/panic_buyings/1").should route_to("panic_buyings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/panic_buyings/1/edit").should route_to("panic_buyings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/panic_buyings").should route_to("panic_buyings#create")
    end

    it "routes to #update" do
      put("/panic_buyings/1").should route_to("panic_buyings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/panic_buyings/1").should route_to("panic_buyings#destroy", :id => "1")
    end

  end
end
