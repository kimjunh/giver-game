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
    @games = GivingGame.where('expiration_time > ? or expiration_time IS NULL', DateTime.now)
    @counter = @games.length
    @charityVotedFor = params[:charity]
  end
  
  def play_game
    @game = GivingGame.find(params[:id])
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    @description = @game.description
    @title = @game.title
    @descriptionA = @game.descriptionA
    @descriptionB = @game.descriptionB
    @showResults = @game.show_results
  end

  def tutorial
    number_of_games = GivingGame.where(:tutorial => true).count
    index = rand(number_of_games)
    games = GivingGame.where(:tutorial => true).collect{|i| i}
    @game = games[index]
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    @description = @game.description
    @showResults = @game.show_results
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