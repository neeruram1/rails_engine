class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  scope :find_by_date, -> (param) {where("to_char(#{param.keys.first},'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%").first}
  scope :find_by_attribute, -> (param) {where("merchants.#{param.keys.first}::text ILIKE ?", "%#{param.values.first}%").first}

  def self.find_merchant(param)
    if param.keys.first == 'created_at' || param.keys.first == 'updated_at'
      Merchant.find_by_date(param)
    else
      Merchant.find_by_attribute(param)
    end
  end
end
