class GamesController < ApplicationController

  def index
  end

  def new
  end
  
  def create
    GivingGame.new(params[:giving_game].permit(:title, :description, :total_money, :per_transaction, :charityA_title, :charityB_title))
    redirect_to games_path
  end

  def play
  end

  def tutorial
  end

end