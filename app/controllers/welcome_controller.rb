class WelcomeController < ApplicationController
  layout "interior_design"
  def index
    @page_title = "Search for students information"
    load_twitter_api
    @latest_batch_messages = @client.user_timeline("scrfitb11x")
  end

  def tos

  end

end
