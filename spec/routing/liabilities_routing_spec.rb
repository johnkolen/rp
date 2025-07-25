require "rails_helper"

RSpec.describe LiabilitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/liabilities").to route_to("liabilities#index")
    end

    it "routes to #new" do
      expect(get: "/liabilities/new").to route_to("liabilities#new")
    end

    it "routes to #show" do
      expect(get: "/liabilities/1").to route_to("liabilities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/liabilities/1/edit").to route_to("liabilities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/liabilities").to route_to("liabilities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/liabilities/1").to route_to("liabilities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/liabilities/1").to route_to("liabilities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/liabilities/1").to route_to("liabilities#destroy", id: "1")
    end
  end
end
