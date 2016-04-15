class GivingGame < ActiveRecord::Base
  belongs_to :user

  # titles of giving games should be unique
  validates :title, uniqueness: true
  validates :total_money, :numericality => { :greater_than_or_equal_to => 0 }
  validates :per_transaction, :numericality => { :greater_than_or_equal_to => 0 }
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
  # has_attached_file :image, styles: {large: '600x600>', medium: '300x300>', thumbnail: '150x150#' }
  # validates_attachment_content_type :image, content_type: /\image\/.*\Z/
end