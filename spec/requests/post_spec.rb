require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#index" do
    before do
      @user = User.new(
        username: "hoge",
        email:    "hoge@g.com",
        password: "hogeho",
      )

      @post = @user.posts.create(
        title:   "this is test",
        content: "this is content test",
      )
    end

    it "responds successfully" do
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
