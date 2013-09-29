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
      flash[:notice] = "Your email/user ID or password is incorrect."
      redirect_to welcome_path
    end
  end
  
  def destroy
    logouted_user = current_user.email
    session[:user_id]  = nil
    redirect_to  root_path,notice: "You've(#{logouted_user}) signed out. See you again soon!"
  end
end
