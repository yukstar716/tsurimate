require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    user = User.new(
      username: "Aaron",
      email:      "te@gcom",
      password:   "akasatana",
    )
    expect(user).to be_valid
  end

  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")  
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")  
  end

  # パスワードがなければ無効な状態であること
  it "is invalid without an password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")  
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      username: "yukstar",
      email:    "yuk@g.com",
      password: "yukstar",
    )

    user = User.new(
      username: "yukstarrrr",
      email:    "yuk@g.com",
      password: "yukstarrrr"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")  
  end
  # ユーザーのフルネームを文字列として返すこと
  it "returns a user's full name as a string"

  # パスワードは6文字以上であること
  it "is valid password more than 6 characters" do
    user = User.new(
      username: "hoge",
      email:    "hoge@g.com",
      password: "hogehoge"
    )
    #user.valid?
    expect(user).to be_valid
  end
end
