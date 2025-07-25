require "rails_helper"

RSpec.describe PropertyTaxesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/property_taxes").to route_to("property_taxes#index")
    end

    it "routes to #new" do
      expect(get: "/property_taxes/new").to route_to("property_taxes#new")
    end

    it "routes to #show" do
      expect(get: "/property_taxes/1").to route_to("property_taxes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/property_taxes/1/edit").to route_to("property_taxes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/property_taxes").to route_to("property_taxes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/property_taxes/1").to route_to("property_taxes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/property_taxes/1").to route_to("property_taxes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/property_taxes/1").to route_to("property_taxes#destroy", id: "1")
    end
  end
end
