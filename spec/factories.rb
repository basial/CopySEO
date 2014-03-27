require 'factory_girl'

FactoryGirl.define do
  factory :user, class: User do
    email 'example1@gmail.com'
    password 'verystrongpassword'
    password_confirmation  "verystrongpassword"
    admin false
    confirmation_token nil
    confirmed_at DateTime.now - 1.second
  end

  factory :admin, class: User do
    email 'example@gmail.com'
    password 'verystrongpassword'
    password_confirmation  "verystrongpassword"
    admin true
    confirmation_token nil
    confirmed_at DateTime.now - 1.second
  end

  factory :category, class: Category do
    title 'Awesome category'
    description 'Very cool items to buy.'
  end
end