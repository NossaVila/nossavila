FactoryGirl.define do
  factory :company do |s|
    s.name  { Faker:: Lorem.words(2) }
    s.description { Faker:: Lorem.words(5) }
    s.address { Faker::Address.street_name }
    s.cep { Faker::Number.number(8) }
    s.cnpj { Faker::Number.number(11) }
    s.area_code { Faker::Number.number(2) }
    s.phone_number { Faker::Number.number(8) }
    s.site { Faker::Internet.domain_name }
  end
end