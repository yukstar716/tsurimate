require 'rails_helper'

RSpec.describe "Registrations", type: :system do
  before do
    @user = User.create!(
      username: "Yukstar",
      email:    "yukstar@gcom",
      password: "yukstar716",
    )
  end

  it "is login" do
    visit  "users/sign_in"
    fill_in "user_email",	with: "yukstar@gcom" 
    fill_in "user_password",	with: "yukstar716"
    click_on "Log in"
    expect(page).to have_content "ログインしました"
  end
end
