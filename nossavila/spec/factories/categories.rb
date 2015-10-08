FactoryGirl.define do
  factory :category do
    name "Transportation"
    services {|s| [s.association(:services)] }
    subcategories { |s| [s.association(:subcategories)] }
  end

end
