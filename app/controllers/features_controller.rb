class FeaturesController < ApplicationController

  layout :which_layout
  def which_layout
    #because dictionary action is testing action
    mobile_device? ? 'application.mobile.erb' : 'interior_design'
  end

  def education

  end

  def batch_messages
    #flash[:alert_warning] = "Confidential data "
    load_twitter_api
    @latest_batch_messages = @client.user_timeline("scrfitb11x")
  end

  def dictionary

  end

  def gpa

  end

  def mailer
    render text: "mailer"
  end

  def internships
    @latestRecords = Internship.last 5
    @latestRecords.reverse!

  end

  def search
    search_key = params[:search_key]
    if params[:search_key].length < 2
    return false
    end

    @search_result = Profile.search(search_key)
    respond_to do |format|
      format.js {render "search"}
      format.mobile {render "search_mobile"}
      format.json {render json: @search_result }
    end
  #render "search_result"
  end

  def add_user
    flash[:alert_danger] = "Please add users who can trust!"
    authorize! :create, User #https://github.com/ryanb/cancan/wiki/Controller-Authorization-Example and https://github.com/ryanb/cancan/wiki/authorizing-controller-actions
  end

  def interns_by_company

    company_name = params[:company_name].downcase

    @interns = Internship.where("lower(company_name) = ?", company_name)
    respond_to do |format|
      format.js {render "interns"}
      format.html {render "internshtml"}
      format.mobile {render "search_mobile"}
      format.json {render json: @interns }
    end
  #render "search_result"
  end

  def create_user
    authorize! :create, User
    # render text: allowed_registration_params
    # return 0
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    new_user = User.new allowed_registration_params
    #@user.skip_confirmation! # Sets confirmed_at to Time.now, activating the account
    if new_user.save
      flash[:alert_success] = "New user #{params[:registration_number]} added successfully"
      redirect_to user_register_path
    else
      flash[:alert_warning] = new_user.errors.full_messages
      render 'add_user'
    end

  end

  protected

  def allowed_registration_params
    params.require(:user).permit(:registration_number,:password,:password_confirmation,:role)
  end

end
