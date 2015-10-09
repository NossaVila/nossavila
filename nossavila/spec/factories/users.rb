FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.username { Faker::Lorem.characters(10) }
    f.address { Faker::Address.street_name }
    f.cep { Faker::Number.number(8) }
    f.cpf { Faker::Number.number(11) }
   end
 end