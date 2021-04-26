class PostCommentRepliesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment_reply = post.post_comment_replies.build(post_comment_reply_params)
    @comment_reply.user_id = current_user.id
    if @comment_reply.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  
end
