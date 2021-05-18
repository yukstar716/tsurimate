require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(
      username: "hogehoge",
      email:    "hogehoge@g.com",
      password: "hogehoge",
    )

    @user.posts.create(
      title: "This is duplicate post",
      content: "this is test",
    )
  end
  #ユーザー単位では重複した投稿タイトルを許可しない
  it "does not allow duplicate post names per user" do
    
    new_post = @user.posts.build(
      title: "This is duplicate post",
      content: "this is testttt",
    )

    new_post.valid?
    expect(new_post.errors[:title]).to include("has already been taken")
  end

  #二人のユーザーが同じ投稿タイトルを使うことは許可すること
  it "allows two users to share a project name" do

    another_user = User.create(
      username: "hogehogehoge",
      email:    "hogehogehoge@g.com",
      password: "hogehogehoge",
    )

    another_post = another_user.posts.build(
      title: "This is duplicate post",
      content: "this is testttt",
    )
    expect(another_post).to be_valid  
  end
end
