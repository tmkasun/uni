class FeaturesController < ApplicationController
  layout "interior_design"
  
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
  
  def search
    search_key = params[:search_key] and return if params[:search_key].length < 2  
    
    @search_result = Student.where('registration_number like ?',"%#{search_key}%").limit(10).order('registration_number')  
    
    render "search_result"
    
    
  end
end
