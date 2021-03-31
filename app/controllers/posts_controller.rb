class PostsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
  
  def new
  end
  
  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to top_path
    else
      render 'posts/new'
    end
  end

  def destroy
  end

  def posts_params
    params.require(:posts).permit(:title, :content)
  end
end
