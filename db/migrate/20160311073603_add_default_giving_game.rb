class AddDefaultGivingGame < ActiveRecord::Migration
  def change
    change_column :giving_games, :title, :string, :default => 'default title'
    change_column :giving_games, :description, :text, :default => 'default description'
    change_column :giving_games, :release_date, :datetime, :default => DateTime.now
    change_column :giving_games, :total_money, :decimal, :default => 10.00
    change_column :giving_games, :per_transaction, :decimal, :default => 1.00
    change_column :giving_games, :created_at, :datetime, :default => DateTime.now
    change_column :giving_games, :updated_at, :datetime, :default => DateTime.now
    change_column :giving_games, :charityA_title, :string, :default => 'Charity A'
    change_column :giving_games, :charityB_title, :string, :default => 'Charity B'
    change_column :giving_games, :votesA, :integer, :default => 0
    change_column :giving_games, :votesB, :integer, :default => 0
  end
end
