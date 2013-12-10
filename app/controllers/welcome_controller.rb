class WelcomeController < ApplicationController
  layout "interior_design"
  def index
    @page_title = "Search for students information"
    respond_to do |format|
      format.mobile  {render 'index'}
      format.html
    end
    
  end

  def tos

  end

end
