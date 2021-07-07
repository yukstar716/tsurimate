require 'rails_helper'

RSpec.describe "Posts", type: :request do

  let(:user) { User.create(
    username: "hoge",
    email:    "hoge@g.com",
    password: "hogehoge",
  )}

  describe "#index" do
    it "responds success" do
      get "/top"
      expect(response).to have_http_status(:success)
    end

    it "returns a 200 response" do
      get "/top"
      expect(response).to have_http_status "200"  
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/posts/new"
      expect(response).to have_http_status(:success)
    end
  end
end
