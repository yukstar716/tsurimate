require 'rails_helper'

RSpec.describe "PostForms", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/post_form/new"
      expect(response).to have_http_status(:success)
    end
  end

end
