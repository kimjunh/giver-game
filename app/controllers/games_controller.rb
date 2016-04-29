class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title, :description, :total_money, :per_transaction, :charityA_title, :descriptionA, :charityB_title, :descriptionB, :expiration_time, :tutorial, :show_results, :charityA_image, :charityB_image, :charityA_image_cache, :charityB_image_cache)
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
    if game_params[:expiration_time]
      gp = game_params
      gp[:expiration_time] = Date.strptime(game_params[:expiration_time], "%m/%d/%Y")
      game_params = gp
    end
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
      @expiration_time = @game.expiration_time.strftime("%m/%d/%Y")
      @tutorial = @game.tutorial
    end
  end

  def tutorial
    number_of_games = GivingGame.where(:tutorial => true).count
    index = rand(number_of_games)
    games = GivingGame.where(:tutorial => true).collect{|i| i}
    redirect_to play_game_path(:id => games[index].id)
  end
  
  def check_if_played_and_reroute
    game = GivingGame.find(params[:id])
    charityA = game.charityA_title
    charityB = game.charityB_title
    charity = params[:charity]
    if charity == charityA
      game.voteForA
    elsif charity == charityB
      game.voteForB
    end
    show_results = game.show_results
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
      if current_user.present? and current_user.played_games.include? game.id
        flash[:warning] = "You have already played that game."
        redirect_to play_index_path and return
      else
          current_user.add_to_played_giving_games(game)
      end
    end
    if show_results == true
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
    @owner = @game.user_id
    @expired = @game.expired
    @charityVotedFor = params[:charity]
    @title = @game.title
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    @votesA = @game.votesA
    @votesB = @game.votesB
    @current_moneyA = @votesA * @game.per_transaction
    @current_moneyB = @votesB * @game.per_transaction
    @total_money = @game.total_money
    @votes_progressA = (@current_moneyA / @total_money) * 100
    @votes_progressB = (@current_moneyB / @total_money) * 100
    
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