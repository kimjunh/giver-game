class GivingGame < ActiveRecord::Base
  belongs_to :user

  # titles of giving games should be unique
  validates :title, uniqueness: true
  
  # needs titles for all of the titles of things.
  validates_presence_of :title, :charityA_title, :charityB_title, :total_money, :per_transaction

  #validates that the moneys need to be numebrs
  validates_numericality_of :per_transaction, :total_money

  def voteForA
    self.votesA += 1
    self.save
  end
    
  def voteForB
    self.votesB += 1
    self.save
  end
end