class OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    sign_in_and_redirect @user
    set_flash_message(:notice, :success, kind: "twitter") if is_navigational_format?
  end

  #def passthru
  #  render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  #end
end
