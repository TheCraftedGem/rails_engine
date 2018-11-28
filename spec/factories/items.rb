FactoryBot.define do
  factory :item do
    name { "Moose Knuckles" }
    description { "Hairy" }
    unit_price { 1 }
    merchant { create(:merchant)}
  end
end
