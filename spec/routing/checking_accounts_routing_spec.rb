require "rails_helper"

RSpec.describe CheckingAccountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/checking_accounts").to route_to("checking_accounts#index")
    end

    it "routes to #new" do
      expect(get: "/checking_accounts/new").to route_to("checking_accounts#new")
    end

    it "routes to #show" do
      expect(get: "/checking_accounts/1").to route_to("checking_accounts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/checking_accounts/1/edit").to route_to("checking_accounts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/checking_accounts").to route_to("checking_accounts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/checking_accounts/1").to route_to("checking_accounts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/checking_accounts/1").to route_to("checking_accounts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/checking_accounts/1").to route_to("checking_accounts#destroy", id: "1")
    end
  end
end
