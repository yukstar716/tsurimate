class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def hello
    render html: "hello, world!"
  end

  def after_sign_in_path_for(resources)
    if current_user
      flash[:notice] = "ログインしました"
      top_path
    else
      flash[:notice] = "新規登録が完了しました。早速質問を投稿してみましょう！"
      top_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :image, :description, :provider, :uid, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image, :description])
  end
end
