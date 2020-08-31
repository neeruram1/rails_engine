class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_single_item(search_term)
    Item.where("name ILIKE ?", "%#{search_term}%").first
  end
end
