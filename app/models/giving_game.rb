class GivingGame < ActiveRecord::Base
  belongs_to :user

  # titles of giving games should be unique
  validates :title, uniqueness: true
  # money valuse should be greater than or equal to 0 and numbers
  validates :total_money, :numericality => { :greater_than_or_equal_to => 0 }
  validates :per_transaction, :numericality => { :greater_than_or_equal_to => 0 }
  # needs titles for all of the titles of things.
  validates_presence_of :title, :charityA_title, :charityB_title, :total_money, :per_transaction

  mount_uploader :charityA_image, CharityAImageUploader
  mount_uploader :charityB_image, CharityBImageUploader

  def voteForA
    self.votesA += 1
    self.save
  end
    
  def voteForB
    self.votesB += 1
    self.save
  end
end