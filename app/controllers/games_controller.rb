class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title, :description, :total_money, :per_transaction, :charityA_title, :descriptionA, :charityB_title, :descriptionB, :tutorial)
  end
  
  def home
  end

  def new
  end
  
  def create
    if GivingGame.find_by title: params[:game][:title]
      flash[:notice] = "There is already a Giving Game called #{params[:game][:title]}."
    else
      @game = GivingGame.create!(game_params)
      flash[:notice] = "Giving Game #{@game.title} successfully created."
    end
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
    @showResults = @game.show_results
  end

  def tutorial
    @game = GivingGame.where(:title => 'Tutorial').first
    @charityOne = @game.charityA_title
    @charityTwo = @game.charityB_title
    @description = @game.description
  end
  
  def results
    @charity = params[:charity]
    @game = params[:game]
  end
end