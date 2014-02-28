class WelcomeController < ApplicationController
  layout :which_layout
  def which_layout
    mobile_device? ? 'application.mobile.erb' : 'interior_design'
  end

  def index
    @page_title = "Search for students information"
    @latestRecord = Internship.last 5
    respond_to do |format|
      format.html
      format.mobile
    end
  end

  def tos

  end

  def test
    
  end
end
