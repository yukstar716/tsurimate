class PostCommentsController < ApplicationController
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
    @comment = PostComment.find(params[:id])
    if @post_comment.destroy
      render :show
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content)
  end
end
