class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true, numericality: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  scope :find_by_date, -> (param) {where("to_char(#{param.keys.first},'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%")}
  scope :find_by_attribute, -> (param) {where("items.#{param.keys.first}::text ILIKE ?", "%#{param.values.first}%")}

  def self.find_item(param)
    attribute = param.keys.first
    if attribute == 'created_at' || attribute == 'updated_at'
      find_by_date(param).first
    else
      find_by_attribute(param).first
    end
  end

  def self.find_all_items(param)
    attribute = param.keys.first
    if attribute == 'created_at' || attribute == 'updated_at'
      find_by_date(param)
    else
      find_by_attribute(param)
    end
  end
end
