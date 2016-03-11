require 'spec_helper'
require 'factory_girl'

RSpec.describe GivingGame, :type => :model do
    describe 'processes votes' do
        it 'should allow you to vote for charity a' do
            givingGame = FactoryGirl.build(:giving_game)
            givingGame.voteForA
            
            givingGame.votesA.should == 1
        end
        it 'should allow you to vote for charity b' do
            givingGame = FactoryGirl.build(:giving_game)
            givingGame.voteForB
            
            givingGame.votesB.should == 1
        end        
    end
end