require "rails_helper"

RSpec.describe CoppersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/coppers").to route_to("coppers#index")
    end

    it "routes to #new" do
      expect(get: "/coppers/new").to route_to("coppers#new")
    end

    it "routes to #show" do
      expect(get: "/coppers/1").to route_to("coppers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/coppers/1/edit").to route_to("coppers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/coppers").to route_to("coppers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/coppers/1").to route_to("coppers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/coppers/1").to route_to("coppers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/coppers/1").to route_to("coppers#destroy", id: "1")
    end
  end
end
