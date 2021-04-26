class PostCommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  #before_action :authenticate_user!
  
  def create
    post = Post.find(params[:post_id])
    @comment = post.post_comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = PostComment.find_by(post_id: params[:post_id], id: params[:id])
    #binding.pry
    if @comment.destroy
      redirect_to controller: :posts, action: :index
    else
      redirect_to controller: :posts, action: :index
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content)
  end
end
