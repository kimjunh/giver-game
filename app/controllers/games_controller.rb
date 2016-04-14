class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title, :description, :total_money, :per_transaction, :charityA_title, :descriptionA, :charityB_title, :descriptionB, :tutorial)
  end
  
  def home
  end

  def new
  end
  
  def edit
    @game = GivingGame.find(params[:id])
  end
  
  def update
    if GivingGame.find_by title: params[:game][:title]
      flash[:notice] = "The title #{params[:game][:title]} is already taken."
      redirect_to edit_game_path(current_user.id, params[:id])
    else
      @game = GivingGame.find params[:id]
      @game.update_attributes!(game_params)
      flash[:notice] = "Successfully edited."
      redirect_to user_profile_path(current_user.id)
    end
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
    @descriptionA = @game.descriptionA
    @descriptionB = @game.descriptionB
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