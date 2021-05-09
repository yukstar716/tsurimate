class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  def create
    #user = current_user
    #post = Post.find(parasms[:post_id])
    Like.create(user_id: current_user.id, post_id: params[:id])
  end

  def destroy
    #user = current_user
    #post = Post.find(params[:post_id])
    Like.find_by(user_id: current_user.id, post_id: params[:id]).delete
  end

  private
  def set_like
    @post = Post.find(params[:post_id])
  end
end
