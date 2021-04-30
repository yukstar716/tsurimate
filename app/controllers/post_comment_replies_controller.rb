class PostCommentRepliesController < ApplicationController
  before_action :set_post,    only: [:create, :destroy]
  before_action :set_comment, only: [:create, :destroy]

  def new
    @comment_reply = PostCommentReply.new
  end
  
  def create
    #post = Post.find(params[:id])
    #post_comment = PostComment(params[:id])
    @comment_reply = @post.post_comment_replies.build(comment_reply_params)
    @comment_reply.user_id = current_user.id
    @comment_reply.post_comment_id = params[:post_comment_id]
    #set_replies
    if @comment_reply.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    #@post_comment_reply = PostCommentReply.find_by(post_id: params[:post_id], post_comment_id: params[:post_comment_id], id: params[:id])
    @post_comment_reply = PostCommentReply.find(params[:id])
    set_replies
    if @post_comment_reply.destroy
      redirect_to controller: :posts, action: :index
    else
      redirect_to controller: :posts, action: :index
    end
  end

  private

  def comment_reply_params
    params.require(:post_comment_reply).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @post_comment = PostComment.find(params[:post_comment_id])
  end

  def set_replies
    @comment_reply = @post.post_comment_replies.includes(:user)
  end
  
end
