require "spec_helper"

describe ProceduresController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/procedures").should route_to("procedures#index")
    end

    it "routes to #new" do
      get("/admin/procedures/new").should route_to("procedures#new")
    end

    it "routes to #show" do
      get("/admin/procedures/1").should route_to("procedures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/procedures/1/edit").should route_to("procedures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/procedures").should route_to("procedures#create")
    end

    it "routes to #update" do
      put("/admin/procedures/1").should route_to("procedures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/procedures/1").should route_to("procedures#destroy", :id => "1")
    end

  end
end
