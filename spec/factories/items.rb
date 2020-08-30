FactoryBot.define do
  factory :item do
    merchant
    name { "Banana Stand" }
    description { "There's always money in the banana stand." }
    unit_price { 5.0 }
  end
end
