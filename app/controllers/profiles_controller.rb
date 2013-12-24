class ProfilesController < ApplicationController
  load_and_authorize_resource
  layout :which_layout
  def which_layout
    #because dictionary action is testing action
    mobile_device? ? 'application.mobile.erb' : 'interior_design'
  end

  def show
    # render text: params
    # return 0
    @profile = Profile.find params[:id]
    respond_to do |format|
      format.html
      format.json {
        render json: @profile
      }
    end
  # render json: @profile
  end

  def edit
    @profile = Profile.find params[:id]
  end

  def update
    @updated_profile = Profile.find(params[:id])
    if @updated_profile.update_attributes(profile_params)
      flash[:alert_success] = "Profile updated."
      redirect_to @updated_profile
    else
      @title = "Edit user"
      flash[:alert_warning] = @updated_profile.errors.full_messages
      @profile = Profile.find(params[:id])
      render 'edit'
    end
  end


  private

  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def profile_params
    params.require(:profile).permit(:phone_number, :home_address,:school,:al_stream,:gender,:degree,:id, :picture)
  end

end
