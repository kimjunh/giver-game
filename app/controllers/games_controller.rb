class GamesController < ApplicationController

  def index
  end

  def new
  end

  def play
  end

  def tutorial
    @game = GivingGame.where(:title => 'Tutorial').first
    @charityOne = @game.charityA_title
    @charityTwo = @game.charityB_title
    @description = @game.description
  end
  
  def results
    @params = params
  end
end