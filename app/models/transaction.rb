class Transaction < ApplicationRecord
  validates :credit_card_number, presence: true, numericality: { only_integer: true }
  validates :credit_card_expiration_date, presence: true
  validates :result, presence: true
end