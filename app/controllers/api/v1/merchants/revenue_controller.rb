class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity]))
  end

  def show
    render json: RevenueSerializer.new(RevenueFacade.total_merchant_revenue(params[:id]))
  end
end
