class AddCharityBImageToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :charityB_image, :string
  end
end
