class AddImagesToGivingGames < ActiveRecord::Migration
  def self.up
    change_table :giving_games do |t|
      t.attachment :image
    end
  end
  
  def self.down
    remove_attachment :posts, :image
  end
end
