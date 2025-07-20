require "rails_helper"

RSpec.describe SavingsAccountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/savings_accounts").to route_to("savings_accounts#index")
    end

    it "routes to #new" do
      expect(get: "/savings_accounts/new").to route_to("savings_accounts#new")
    end

    it "routes to #show" do
      expect(get: "/savings_accounts/1").to route_to("savings_accounts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/savings_accounts/1/edit").to route_to("savings_accounts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/savings_accounts").to route_to("savings_accounts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/savings_accounts/1").to route_to("savings_accounts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/savings_accounts/1").to route_to("savings_accounts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/savings_accounts/1").to route_to("savings_accounts#destroy", id: "1")
    end
  end
end
