class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title, :description, :total_money, :per_transaction, :charityA_title, :descriptionA, :charityB_title, :descriptionB, :tutorial, :show_results)
  end
  
  def home
  end

  def new
    if current_user.nil?
      flash[:warning] = "You must be logged in to create a new giving game."
      redirect_to new_user_session_path
    end
    @game = GivingGame.new(session[:game]) || GivingGame.new()
    if @session and @session.key? :game
      @session.delete(:game)
    end
  end
  
  def edit
    if session[:game]
      @game = GivingGame.new(session[:game])
      @game.id = params[:id]
      session.delete :game
    else
      @game = GivingGame.find(params[:id])
    end
  end
  
  def update
    game = GivingGame.find(params[:id])
    game.assign_attributes(game_params)
    if game.valid?
      GivingGame.update(params[:id], game_params)
      flash[:success] = "Successfully edited."
      redirect_to user_profile_path(current_user.id)
    else
      totalMessage = ""
      game.errors.messages.each do |key, message|
        if params.key? key 
          params.delete key  
        end
        totalMessage += "#{key.to_s().gsub('_', ' ').capitalize} #{message.join("', and'")}; "
      end
      flash[:danger] = totalMessage
      session[:game] = params[:game]
      redirect_to edit_game_path(current_user.id, params[:id])
    end
  end

  def create
    success = true 
    game = GivingGame.create(game_params)

    if game.valid?
      @game = game
      flash[:success] = "Giving Game #{@game.title} successfully created."
      current_user.add_to_created_giving_games(game)
    else
      totalMessage = ""
      game.errors.messages.each do |key, message|
        if params[:game].key? key
          params[:game].delete(key)
        end
        totalMessage += "#{key.to_s().gsub('_', ' ').capitalize} #{message.join("', and'")}; "
      end
      flash[:danger] = totalMessage
      session[:game] = params[:game]
      success = false
    end
    
    if success
      redirect_to root_path
    else
      redirect_to new_game_path
    end
  end

  def play_index
    @games = GivingGame.where("expiration_time > ? OR expiration_time IS NULL AND expired = ?", DateTime.now, false)
    @counter = @games.length
    @charityVotedFor = params[:charity]
  end
  
  def play_game
    chosen_game = GivingGame.find(params[:id])

    if current_user.nil? and !chosen_game.tutorial?
      flash[:warning] = "You must be logged in to play an actual giving game."
      redirect_to new_user_session_path
    else
      @game = chosen_game
      @charityA = @game.charityA_title
      @charityB = @game.charityB_title
      @description = @game.description
      @title = @game.title
      @descriptionA = @game.descriptionA
      @descriptionB = @game.descriptionB
      @showResults = @game.show_results
    end
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
  
  def check_if_played_and_reroute
    game = GivingGame.find(params[:id])
    show_results = params[:show_results]
    charity = params[:charity]
    total_moneyA = game.votesA * game.per_transaction
    total_moneyB = game.votesB * game.per_transaction
    money_allowed = game.total_money
    if money_allowed <= total_moneyA + total_moneyB
      if !game.tutorial
        game.expired = true
        game.save
      end
    end
    if !game.tutorial
      if current_user.played_games.include? game.id
        flash[:warning] = "You have already played that game."
        redirect_to play_index_path
      else
          current_user.add_to_played_giving_games(game)
      end
    end
    if show_results == 'true'
      redirect_to results_path(:id => game.id, :charity => charity)
    else
      redirect_to play_index_path(:charity => charity)
    end
  end
  
  def archive
    @games = GivingGame.where("expired = ? OR expiration_time < ?", true, DateTime.now)
    @counter = @games.length
  end
  
  def archive_game
      @game = GivingGame.find(params[:id])
      @charityA = @game.charityA_title
      @charityB = @game.charityB_title
      @description = @game.description
      @title = @game.title
      @descriptionA = @game.descriptionA
      @descriptionB = @game.descriptionB
      @showResults = @game.show_results
  end
  
  def results
    @game = GivingGame.find(params[:id])
    @expired = @game.expired
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