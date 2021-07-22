require 'rails_helper'

RSpec.describe "Statuses", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/statuses/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/statuses/new"
      expect(response).to have_http_status(:success)
    end
  end

end
