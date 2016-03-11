class UpdateGivingGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :total_money, :decimal, :precision => 8, :scale => 2
    add_column :giving_games, :per_transaction, :decimal, :precision => 8, :scale => 2
    add_column :giving_games, :charityA_title, :string
    add_column :giving_games, :charityB_title, :string
    add_column :giving_games, :votesA, :integer
    add_column :giving_games, :votesB, :integer
  end
end
