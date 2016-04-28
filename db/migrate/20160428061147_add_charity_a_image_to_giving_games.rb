class AddCharityAImageToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :charityA_image, :string
  end
end
