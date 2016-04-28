class ChangeExpiredDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :giving_games, :expired, :boolean, :default => false
  end
end
