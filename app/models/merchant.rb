class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  scope :find_by_date, -> (param) {where("to_char(#{param.keys.first},'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%#{param.values.first}%")}
  scope :find_by_attribute, -> (param) {where("merchants.#{param.keys.first}::text ILIKE ?", "%#{param.values.first}%")}

  def self.find_merchant(param)
    attribute = param.keys.first
    if attribute == 'created_at' || attribute == 'updated_at'
      find_by_date(param).first
    else
      find_by_attribute(param).first
    end
  end

  def self.find_all_merchants(param)
    attribute = param.keys.first
    if attribute == 'created_at' || attribute == 'updated_at'
      find_by_date(param)
    else
      find_by_attribute(param)
    end
  end

  def self.most_revenue(param)
    Merchant.select("merchants.*, sum(quantity * unit_price) as revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .where("invoices.status = 'shipped'")
    .group(:id)
    .order("revenue desc")
    .limit(param)
  end

  def self.most_items_sold(param)
    Merchant.select("merchants.*, sum(quantity) as items_sold")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful).group(:id)
    .order("items_sold desc").limit(param)
  end

  def total_revenue
    invoice_items.joins(:transactions, :invoice)
    .merge(Transaction.successful)
    .where("invoices.status = 'shipped'")
    .sum("quantity * unit_price")
  end
end
