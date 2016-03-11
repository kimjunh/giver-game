class GivingGame < ActiveRecord::Base
  def voteForA
    self.votesA += 1
  end
    
  def voteForB
    self.votesB += 1
  end
end