require 'rails_helper'

RSpec.describe "Plans", type: :request do
  describe "GET /index" do
    context "no user" do
      it "redirects" do
        get "/plan/index"
        expect(response).to have_http_status(:redirect)
      end
    end
    context "user" do
      it "returns http success" do
        person = create(:person)
        user = person.user
        sign_in user, scope: :user
        get "/plan/index"
        expect(response).to have_http_status(:success)
        sign_out user
      end
    end
  end

end
