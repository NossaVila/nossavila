FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.username { Faker::Lorem.characters(10) }
    f.password { Faker::Internet.password(min_length = 8, max_length = 16) }
    f.address { Faker::Address.street_name }
    f.housenumber { Faker::Address.building_number }
    f.cep { Faker::Number.number(8) }
    f.email { Faker::Internet.email }
    f.cpf { Faker::Number.number(11) }
   end
 end