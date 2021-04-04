class PostsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
  
  def index
    #@posts = Post.all.order(created_at: "desc")
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

  def show
    @post = Post.all
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
