class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title, :description, :total_money, :per_transaction, :charityA_title, :charityB_title)
  end

  def index
  end

  def new
    
  end
  
  def create
    @game = GivingGame.create!(game_params)
    flash[:notice] = "#{@game.title} successfully created."
    redirect_to root_path
  end

  def play
    @games = GivingGame.all
    @counter = 0
  end

  def tutorial
    @game = GivingGame.where(:title => 'Tutorial').first
    @charityOne = @game.charityA_title
    @charityTwo = @game.charityB_title
    @description = @game.description
  end
  
  def results
    @charity = params[:charity]
  end
end