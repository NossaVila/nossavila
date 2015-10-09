FactoryGirl.define do
  factory :category do
    name "Transportation"
    services {|s| [s.association(:service)] }
  end
end
