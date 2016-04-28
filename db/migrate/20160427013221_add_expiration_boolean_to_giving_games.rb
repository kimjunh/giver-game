class AddExpirationBooleanToGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :expired, :boolean
  end
end
