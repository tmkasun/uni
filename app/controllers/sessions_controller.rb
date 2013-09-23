class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Thank you for loging to SiS!"
      redirect_to  searches_url 
    else
      flash[:notice] = "Can't find #{params[:email]}"
      render welcome_path
    end
  end
  
  def destroy
    session[:user_id]  = nil
    render text: "done#{session[:user_id]}"
  end
end
