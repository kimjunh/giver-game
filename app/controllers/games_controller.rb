class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title, :description, :total_money, :per_transaction, :charityA_title, :charityB_title)
  end
  
  def home
  end

  def new
  end
  
  def create
    @game = GivingGame.create!(game_params)
    flash[:notice] = "#{@game.title} successfully created."
    redirect_to root_path
  end

  def play_index
    @games = GivingGame.all
    @counter = @games.length
  end
  
  def play_game
    @game = GivingGame.find(params[:id])
    @charityOne = @game.charityA_title
    @charityTwo = @game.charityB_title
    @description = @game.description
    @title = @game.title
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
  
  def navbar_dropdown_redirect
    redirect_to play_game_path(params[:navbar_select])
  end
end