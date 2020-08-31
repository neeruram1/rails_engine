require 'faker'

FactoryBot.define do
  factory :item do
    merchant
    name { Faker::Commerce.unique.product_name }
    description { Faker::Lorem.unique.paragraph }
    unit_price { Faker::Commerce.unique.price }
  end
end
