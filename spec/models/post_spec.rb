require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "post validation" do
    let(:user) { User.create(
      username: "hogehoge",
      email:    "hogehoge@g.com",
      password: "hogehoge",
      )}
  
    before do
      user.posts.create(
        title: "This is duplicate post",
        content: "this is test",
      )
    end

    #ユーザー単位では重複した投稿タイトルを許可しない
    context "when the post is duplicate title" do
      it "does not allow duplicate post names per user" do
        new_post = user.posts.build(
          title: "This is duplicate post",
          content: "this is testttt",
        )
        new_post.valid?
        expect(new_post.errors[:title]).to include("has already been taken")
      end
    end
  
    #二人のユーザーが同じ投稿タイトルを使うことは許可すること
    context "when two users post same title" do
      it "allows to share a title" do
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

    context "when the title is more than 40 characters" do
      it "returns error" do
        post_with_invalid_title = user.posts.build(
          title:   "a" * 41,
          content: "This is content",
        )
        expect(post_with_invalid_title).to be_invalid
      end
    end
    
    context "when the title is less than 41 characters" do
      it "returns success" do
        post_with_valid_title = user.posts.build(
          title:   "a" * 40,
          content: "This is content",
        )
        expect(post_with_valid_title).to be_valid
      end      
    end

    context "when the content is more than 300 characters" do
      it "returns error" do
        post_with_invalid_content = user.posts.build(
          title: "title",
          content: "a" * 301,
        )
        expect(post_with_invalid_content).to be_invalid  
      end
    end

    context "when the content is less than 301" do
      it "returns success" do
        post_with_valid_content = user.posts.build(
          title: "title",
          content: "a" * 300
        )
        expect(post_with_valid_content).to be_valid  
      end
    end
    

    context "when both title and content are filled" do
      it "is valid" do
        valid_post = user.posts.build(
          title: "title",
          content: "content",
        )
        expect(valid_post).to be_valid 
      end
    end

    context "when title is filled and content is empty" do
      it "is invalid" do
        post_without_content = user.posts.build(
          title: "title",
          content: nil,
        )
        expect(post_without_content).to be_invalid 
      end
    end

    context "when title is empty and content is filled" do
      it "is invalid" do
        post_without_title = user.posts.build(
          title: nil,
          content: "content",
        )
        expect(post_without_title).to be_invalid 
      end    
    end
    
    context "when the title is empty" do
      it "is invalid" do
        post = Post.new(title: nil)
        post.valid?
        expect(post.errors[:title]).to include("can't be blank")
      end
    end

    context "when the content is empty" do
      it "is invalid" do
        post = Post.new(content: nil)
        post.valid?
        expect(post.errors[:content]).to include("can't be blank") 
      end
    end
  end
end
