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
    @showResults = true
  end

  def tutorial
    number_of_games = GivingGame.where(:tutorial => true).count
    index = rand(number_of_games)
    games = GivingGame.where(:tutorial => true).collect{|i| i}
    @game = games[index]
    @charityOne = @game.charityA_title
    @charityTwo = @game.charityB_title
    @description = @game.description
  end
  
  def results
    @game = GivingGame.find(params[:id])
    @charityVotedFor = params[:charity]
    @title = @game.title
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    
    if @charityVotedFor == @charityA
      @game.voteForA
    else
      @game.voteForB
    end
    
    @votesA = @game.votesA
    @votesB = @game.votesB
    
    # show which charity is in the lead
    if @votesA > @votesB
      @leadingCharity = @charityA
    elsif @votesA < @votesB
      @leadingCharity = @charityB
    else
      @leadingCharity = nil
    end
  end
end