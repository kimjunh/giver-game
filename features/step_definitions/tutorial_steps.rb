Given /the following games exist/ do |games_table|
  games_table.hashes.each do |game|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    GivingGame.create!(movie)
  end
end