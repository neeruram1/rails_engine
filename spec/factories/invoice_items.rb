require 'faker'

FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity { 15 }
    unit_price { 11.50 }
  end
end
