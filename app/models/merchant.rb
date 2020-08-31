class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.find_single_merchant(search_term)
    Merchant.where("name ILIKE ?", "%#{search_term}%").first
  end
end
