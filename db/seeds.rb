
games = [{:title => 'Tutorial1', :description =>'This is the tutorial for the Giving Game', :charityA_title => 'Against Malaria Foundation', :charityB_title => 'Give Directly', :tutorial => true},
        {:title => 'Tutorial2', :description =>'This is the second tutorial for the Giving Game', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => true},
        {:title => 'Game 1', :description =>'This is not a tutorial', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => false},]
games.each do |game|
    GivingGame.create!(game)
end

user = User.create! :email => 'jo@trader.com', :password => 'lulzlulz', :password_confirmation => 'lulzlulz', :uid => 'Trader_Joe123', :giving_games => GivingGame.all