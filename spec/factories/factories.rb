require 'factory_girl'

FactoryGirl.define do
  factory :giving_game do
    title 'A Fake Title' # default values
    description 'A giving game that does something'
    total_money 10.00
    per_transaction 1.00
    created_at { 10.years.ago }
    updated_at { 2.years.ago }
    charityA_title 'charity A'
    votesA 0
    charityB_title 'charity B'
    votesB 0
  end
end

FactoryGirl.define do
  factory :user do
    email { "fake@fake.com" }
    username "FAKER"
    password "password"
    password_confirmation "password"
  end
end
