class AddExpirationToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :expiration_time, :datetime
  end
end
