class TrackersController < ApplicationController
  layout :which_layout
  def which_layout
    #because dictionary action is testing action
    mobile_device? ? 'application.mobile.erb' : 'interior_design'
  end

  def index
    
  end
end
