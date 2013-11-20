class SessionsController < ApplicationController
  def create
    render :text => 'oks'
  end

  def sign_in
    render :text => 'lahola'
  end
end
