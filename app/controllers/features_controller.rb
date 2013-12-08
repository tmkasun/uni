class FeaturesController < ApplicationController
  layout "interior_design"
  
   def education
    
  end

  def batch_messages
    load_twitter_api
    @latest_batch_messages = @client.user_timeline("scrfitb11x")
  end

  def dictionary
    
  end
  
  def gpa
    
  end

end