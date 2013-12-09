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
    
    # render text: is_number?(search_key.first)
    # return false
    @search_result = Student.where('common_name like ? or name like ? ',"%#{search_key.to_s}%","%#{search_key.to_s}%").limit(15).order(:common_name) 
    @search_result = Student.where('registration_number like ?',"#{search_key.to_s}%").limit(15).order(:registration_number) if is_number?(search_key.first)
        
     
    render "search_result"
  end
  
  private

  def is_number? number
    true if Float(number) rescue false
  end


  
  
end
