require 'spec_helper'

describe GamesController do
  describe "When a post http request is called to the controller, it should do create and end at the index" do
    it "should call create on the model" do
      GivingGame.should_receive(:new).with('title' => 'Test')
      post 'create', {:giving_game => {:title => 'Test'}}
    end
    
    it "should redirect to the index" do
      post 'create', {:giving_game => {:title => 'Test'}}
      response.should redirect_to games_path
    end
    
  end
end