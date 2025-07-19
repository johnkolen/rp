require 'rails_helper'

RSpec.describe "Plans", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/plan/index"
      expect(response).to have_http_status(:success)
    end
  end

end
