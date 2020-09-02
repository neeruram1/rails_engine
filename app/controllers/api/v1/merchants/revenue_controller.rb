class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: MerchantRevenueSerializer.revenue(Merchant.find(params[:id]).total_revenue)
  end
end
