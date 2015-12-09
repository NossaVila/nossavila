FactoryGirl.define do
  factory :service do |s|
    s.title  { Faker:: Lorem.words(3) }
    s.description { Faker:: Lorem.sentence(20) }
    s.address "Baker Street"
  end
end
