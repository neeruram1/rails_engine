class RevenueFacade
  def self.total_merchant_revenue(merchant_id)
    result = Merchant.find(merchant_id).total_revenue
    binding.pry
    result = Revenue.new(result)
  end
end
