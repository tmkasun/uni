class UsersController < ApplicationController
  #layout "interior_design" #FIXME , temporaly removed coz current_user nil class error in layouts
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
    params.require(:user).permit(:registration_number, :password, :password_confirmation)
  end
end
