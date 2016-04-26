class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def profile
    @user = current_user
    @games = current_user.giving_games
  end
end