FactoryBot.define do
  factory :item do
    name { "Moose Knuckles" }
    description { "Hairy" }
    unit_price {rand(1...1000)}
    association :merchant, factory: :merchant
  end
end