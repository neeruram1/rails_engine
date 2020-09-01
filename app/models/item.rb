class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_item(param)
    if param.keys.first == 'created_at'
      Item.where("to_char(created_at,'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%").first
    elsif param.keys.first == 'updated_at'
      Item.where("to_char(updated_at,'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%").first
    else
      Item.where("items.#{param.keys.first}::text ILIKE ?", "%#{param.values.first}%").first
    end
  end
end
