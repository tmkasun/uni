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
    search_key = params[:search_key] 
    if params[:search_key].length < 2
      return false
    end  
    
    @search_result = Student.search(search_key)        
    respond_to do |format|
      format.js {render "search"}
      format.mobile {render "search_mobile"}
    end
    #render "search_result"
  end
  
end
