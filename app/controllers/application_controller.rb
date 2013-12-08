class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'twitter'
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?



  protected

  def load_twitter_api
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "YsafNDRGeV3Ti7bkgCuyA"
      config.consumer_secret     = "sEKh5Z09g4M11FsBwQvFGBQO1F8fIus0CBSFOnYz3Fk"
      config.access_token        = "81788251-zJCyxUoWB45rxxSHBy8lLyhtk3Y6R3YPAII6mpRnA"
      config.access_token_secret = "5Qu392QUsh14KWIKoqo3L1p2paIVqdsK8VvTgwHWmsH0o"
    end
  end
  
  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:registration_number,:password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:registration_number, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:registration_number, :password, :password_confirmation, :current_password) }
  end

end

