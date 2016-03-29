# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
games = [{:title => 'Tutorial1', :description =>'This is the tutorial for the Giving Game', :charityA_title => 'Against Malaria Foundation', :charityB_title => 'Give Directly'},
        {:title => 'Tutorial2', :description =>'This is the second tutorial for the Giving Game', :charityA_title => 'Charity A', :charityB_title => 'Charity B'},
        {:title => 'Game 1', :description =>'This is not a tutorial', :charityA_title => 'Charity A', :charityB_title => 'Charity B'},]
games.each do |game|
    GivingGame.create!(game)
end