class UsersController < ApplicationController
  
  def show
    @user = users(params[:id])
    @post = @user.posts.build(params[:id])
  end
end
