require 'rails_helper'

RSpec.describe Admins::AdminsController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http failed" do
      get :index
      expect(response).not_to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http failed" do
      get :new
      expect(response).not_to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http failed" do
      get :show
      expect(response).not_to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http failed" do
      get :edit
      expect(response).not_to have_http_status(:success)
    end
  end

end
