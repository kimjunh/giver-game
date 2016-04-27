class AddPlayedGamesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :played_games, :text
  end
end
