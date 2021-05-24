require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#show" do
    let (:user) { User.create(
      username: "hogehoge",
      email:    "hogehoge@g.com",
      password: "hogehoge",
    )}

    describe "user is exist" do
      it "responds success" do
        get user_path(user.id)
        expect(response).to have_http_status(:success)
      end
  
      it "returns a 200 respnse" do
        get user_path(user.id)
        expect(response).to have_http_status "200"
      end
    end
  end
end
