class GamesController < ApplicationController

  def index
  end

  def new
  end

  def play
  end

  def tutorial
    @game = GivingGame.where(:title => 'Tutorial')
    @charityOne = @game.charityA_title
    @charityTwo = @game.charityB_title
    @description = @game.description
  end

end