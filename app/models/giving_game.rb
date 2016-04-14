class GivingGame < ActiveRecord::Base
  belongs_to :user
  def voteForA
    self.votesA += 1
  end
    
  def voteForB
    self.votesB += 1
  end
end