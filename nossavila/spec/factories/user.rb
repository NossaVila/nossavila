# spec/factories/user.rb

require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.username { Faker::Name.name }
    f.password { Faker::Internet.password(min_length = 6, max_length = 10) }
    f.address { Faker::Address.street_name }
    f.housenumber { Faker::Address.building_number }
    f.cep { Faker::Number(8) }
    f.email { Faker::Internet.email }
    f.cpf { Faker::Number(11) }
  end
end