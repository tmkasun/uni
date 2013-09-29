class SearchesController < ApplicationController
  layout "interior_design"
  before_filter :authorize
    
  def index
  @page_title = "Search for students information"
  
  end
  
end