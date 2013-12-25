class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'twitter'
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :prepare_for_mobile
  ActionController::Responder.class_eval do alias :to_mobile :to_html end
  layout :layout_by_resource #https://github.com/plataformatec/devise/wiki/How-To%3a-Create-custom-layouts

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert_danger] = exception.message
    redirect_to root_url
  end 
  
  
  
  protected

  def layout_by_resource
    if devise_controller? && params[:action].in?(["edit","update"])
      "interior_design"
   #else
     # "application"
    end
    if is_a?(Devise::SessionsController) && mobile_device? #http://stackoverflow.com/questions/4412018/rails-devise-how-to-render-login-page-without-a-layout
      false
    end
  end
  
  
  def load_twitter_api
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "YsafNDRGeV3Ti7bkgCuyA"
      config.consumer_secret     = "sEKh5Z09g4M11FsBwQvFGBQO1F8fIus0CBSFOnYz3Fk"
      config.access_token        = "81788251-zJCyxUoWB45rxxSHBy8lLyhtk3Y6R3YPAII6mpRnA"
      config.access_token_secret = "5Qu392QUsh14KWIKoqo3L1p2paIVqdsK8VvTgwHWmsH0o"
    end
  end
  
  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:registration_number,:password, :password_confirmation, :remember_me, :role) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:registration_number, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:registration_number, :password, :password_confirmation, :current_password, :role) }
  end
  
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  
  helper_method :mobile_device?
  
 
  

    
=begin
helper_method is useful when the functionality is something that's used between both the controller and the view. A good example is something like current_user.

If the method deals more with controller logic and not formatting then it belongs in the controller. Something like current_user would be shared between all controllers so it should be defined in the ApplicationController.

True "helper" methods deal with the view and handle things like formatting and template logic. These are seldom needed in the controller and they belong in their own module under app/helpers. You can include these in your controller when needed, but you end up with the whole module worth of view helper methods available to your controller.
=end
  
  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

end

