class GivingGames < ActiveRecord::Migration
  def change
    create_table :givingGames do |t|
      t.string :title
      t.text :description
      t.datetime :release_date
      t.decimal :total_money, :precision => 8, :scale => 2
      t.decimal :per_transaction, :precision =>8, :scale => 2
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
      
      # Charity A
      t.string :charityA_title
      t.integer :votesA
      
      # Charity B
      t.string :charityB_title
      t.integer :votesB
    end
  end
end
