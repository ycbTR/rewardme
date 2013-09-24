require "spec_helper"

describe Admin::ActivitySessionsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/activity_sessions").should route_to("admin/activity_sessions#index")
    end

    it "routes to #new" do
      get("/admin/activity_sessions/new").should route_to("admin/activity_sessions#new")
    end

    it "routes to #show" do
      get("/admin/activity_sessions/1").should route_to("admin/activity_sessions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/activity_sessions/1/edit").should route_to("admin/activity_sessions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/activity_sessions").should route_to("admin/activity_sessions#create")
    end

    it "routes to #update" do
      put("/admin/activity_sessions/1").should route_to("admin/activity_sessions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/activity_sessions/1").should route_to("admin/activity_sessions#destroy", :id => "1")
    end

  end
end
