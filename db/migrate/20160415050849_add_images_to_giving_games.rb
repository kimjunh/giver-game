class AddImagesToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :image
  end
end
