class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.find_merchant(param)
    if param.keys.first == 'created_at'
      Merchant.where("to_char(created_at,'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%").first
    elsif param.keys.first == 'updated_at'
      Merchant.where("to_char(updated_at,'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%").first
    else
      Merchant.where("merchants.#{param.keys.first}::text ILIKE ?", "%#{param.values.first}%").first
    end
  end
end
