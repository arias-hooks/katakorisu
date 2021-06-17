require 'rails_helper'

RSpec.describe "Videos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/videos/index"
      expect(response).to have_http_status(:success)
    end
  end
end
