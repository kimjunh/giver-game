class CreateGivingGames < ActiveRecord::Migration
  def change
    create_table :giving_games do |t|
      t.string :title
      t.text :description
      t.datetime :release_date

      t.timestamps null: false
    end
  end
end
