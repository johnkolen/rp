require "rails_helper"

RSpec.describe FixedRateMortgagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fixed_rate_mortgages").to route_to("fixed_rate_mortgages#index")
    end

    it "routes to #new" do
      expect(get: "/fixed_rate_mortgages/new").to route_to("fixed_rate_mortgages#new")
    end

    it "routes to #show" do
      expect(get: "/fixed_rate_mortgages/1").to route_to("fixed_rate_mortgages#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/fixed_rate_mortgages/1/edit").to route_to("fixed_rate_mortgages#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/fixed_rate_mortgages").to route_to("fixed_rate_mortgages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fixed_rate_mortgages/1").to route_to("fixed_rate_mortgages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fixed_rate_mortgages/1").to route_to("fixed_rate_mortgages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fixed_rate_mortgages/1").to route_to("fixed_rate_mortgages#destroy", id: "1")
    end
  end
end
