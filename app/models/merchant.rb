class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.find_single_merchant(attribute, search_term)
    Merchant.where("#{attribute} ILIKE ?", "%#{search_term}%").first
  end
end
