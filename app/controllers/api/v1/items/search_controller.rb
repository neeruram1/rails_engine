class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: ItemSerializer.new(Item.find_item(permitted_param))
  end

  private

  def permitted_param
    params.permit(:name, :unit_price, :description, :created_at, :updated_at)
  end
end
