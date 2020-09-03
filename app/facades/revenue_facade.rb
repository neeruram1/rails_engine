class RevenueFacade
  def self.total_merchant_revenue(merchant_id)
    result = Merchant.find(merchant_id).total_revenue
    Revenue.new(result)
  end

  def self.revenue_by_date_range(start_date, end_date)
    result = Invoice.joins(:invoice_items, :transactions).merge(Transaction.successful).where(status: :shipped, created_at: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day).sum('invoice_items.quantity * invoice_items.unit_price')
    Revenue.new(result)
  end
end
