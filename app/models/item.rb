class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  scope :find_merchant_by_date, -> (param) {where("to_char(#{param.keys.first},'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%").first}
  scope :find_by_attribute, -> (param) {where("items.#{param.keys.first}::text ILIKE ?", "%#{param.values.first}%").first}

  def self.find_item(param)
    if param.keys.first == 'created_at' || param.keys.first == 'updated_at'
      Item.find_merchant_by_date(param)
    else
      Item.find_by_attribute(param)
    end
  end
end
