class AddShowViewsToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :show_results, :boolean
  end
end
