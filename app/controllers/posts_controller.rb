class PostsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]

  
  def index
    @posts = Post.all.order(created_at: "desc")
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    @comment = PostComment.new
    @comments = @post.post_comments
    @comment_replies = @post.post_comment_replies.includes(:user)
    @comment_reply = @post.post_comment_replies.build(user_id: current_user.id) if current_user
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to top_path
    else
      render 'posts/new'
    end
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
