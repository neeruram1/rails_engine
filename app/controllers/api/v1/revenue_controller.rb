class Api::V1::RevenueController < ApplicationController
  def index
    render json: RevenueSerializer.new(RevenueFacade.revenue_by_date_range(params[:start], params[:end]))
  end
end
