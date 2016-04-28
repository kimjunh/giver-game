class ChangeExpireToTrue < ActiveRecord::Migration
  def change
    change_column :giving_games, :expired, :boolean, :default => true
  end
end
