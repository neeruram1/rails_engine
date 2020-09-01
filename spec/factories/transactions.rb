require 'faker'

FactoryBot.define do
  factory :transaction do
    credit_card_number { 123113123123123123 }
    credit_card_expiration_date { "10/23" }
    result { "success" }
    invoice
  end
end
