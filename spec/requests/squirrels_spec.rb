require 'rails_helper'

RSpec.describe "Squirrels", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/squirrels/show"
      expect(response).to have_http_status(:success)
    end
  end

end
