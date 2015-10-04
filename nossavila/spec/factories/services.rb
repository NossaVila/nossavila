FactoryGirl.define do
  factory :service do |s|
    s.title  { Faker:: Lorem.words(5, false) }
    s.description { Faker:: Lorem.sentence(20) }
  end

end
