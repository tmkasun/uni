class UsersController < ApplicationController
  layout "interior_design"
  def new
    @user = User.new
  end
  
  def create
    #render text: allowed_params 
    @user = User.create(allowed_params)
    unless @user.errors.any?
      redirect_to :welcome , notice: "successfully signed up !"
    else
      flash[:message] = @user.errors.full_messages
      render "new"
    end
  end
  
  private 
  def allowed_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
