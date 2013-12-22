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
    end
    #render "search_result"
  end
  
end
