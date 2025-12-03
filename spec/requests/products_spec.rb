require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/products/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /shirts" do
    it "returns http success" do
      get "/products/shirts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sneakers" do
    it "returns http success" do
      get "/products/sneakers"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sweats" do
    it "returns http success" do
      get "/products/sweats"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /afters" do
    it "returns http success" do
      get "/products/afters"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /pants" do
    it "returns http success" do
      get "/products/pants"
      expect(response).to have_http_status(:success)
    end
  end

end
