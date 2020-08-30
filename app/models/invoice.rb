class Invoice < ApplicationRecord
  validates :status, presence: true
  belongs_to :merchant
  belongs_to :customer
end
