class MerchantRevenueSerializer
def self.revenue(revenue)
  {
    "data": {
      "id": nil,
      "attributes": {
        "revenue": revenue
      }
    }
  }
  end
end
