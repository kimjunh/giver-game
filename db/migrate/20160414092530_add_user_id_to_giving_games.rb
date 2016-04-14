class AddUserIdToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :user_id, :integer
  end
end
