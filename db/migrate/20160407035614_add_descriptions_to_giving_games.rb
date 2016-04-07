class AddDescriptionsToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :descriptionA, :string
    add_column :giving_games, :descriptionB, :string
  end
end
