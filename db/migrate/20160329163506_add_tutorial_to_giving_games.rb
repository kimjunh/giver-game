class AddTutorialToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :tutorial, :boolean
  end
end
