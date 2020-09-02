class Transaction < ApplicationRecord
  validates :credit_card_number, presence: true, numericality: { only_integer: true }
  validates :result, presence: true
  belongs_to :invoice
  has_one :customer, through: :invoice

  scope :successful, -> { where(result: "success") }
end
