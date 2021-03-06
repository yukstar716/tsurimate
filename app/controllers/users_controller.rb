class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])    
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を変更しました'
      redirect_to action: :show
    else
      flash[:danger] = 'ユーザー情報の変更に失敗しました'
      redirect_to action: :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :description, :password, :password_confirmation, :image)
  end
end
