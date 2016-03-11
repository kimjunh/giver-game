class GivingGame < ActiveRecord::Base
    def self.voteForA
        self.votesA += 1
    end
end