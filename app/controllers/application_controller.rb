class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_tutorials
  
  #switch this out later
  def get_tutorials
    @tutorials = GivingGame.where(:tutorial => true)
  end
  
end
