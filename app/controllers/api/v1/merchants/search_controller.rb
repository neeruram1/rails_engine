class Api::V1::Merchants::SearchController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.find_merchant(permitted_param))
  end

  private

  def permitted_param
    params.permit(:name, :created_at, :updated_at)
  end
end
