require "spec_helper"

describe ProdDelOrdshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/prod_del_ordships").should route_to("prod_del_ordships#index")
    end

    it "routes to #new" do
      get("/prod_del_ordships/new").should route_to("prod_del_ordships#new")
    end

    it "routes to #show" do
      get("/prod_del_ordships/1").should route_to("prod_del_ordships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prod_del_ordships/1/edit").should route_to("prod_del_ordships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prod_del_ordships").should route_to("prod_del_ordships#create")
    end

    it "routes to #update" do
      put("/prod_del_ordships/1").should route_to("prod_del_ordships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prod_del_ordships/1").should route_to("prod_del_ordships#destroy", :id => "1")
    end

  end
end
