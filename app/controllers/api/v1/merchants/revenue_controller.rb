class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity]))
  end

  def show
    render json: MerchantRevenueSerializer.revenue(Merchant.find(params[:id]).total_revenue)
  end
end
