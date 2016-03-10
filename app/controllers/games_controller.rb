class GamesController < ApplicationController

  def index
  end

  def new
  end

  def play
  end

  def tutorial
    @game = 
    @charityUno = @game.name1 
    @charityDos = @game.name2
    if button pushed
      flash[:notice] = "You loyal. You smart."
    end
    
  end

end