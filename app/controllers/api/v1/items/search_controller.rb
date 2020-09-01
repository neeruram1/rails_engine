class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.find_all_items(permitted_param))
  end

  def show
    render json: ItemSerializer.new(Item.find_item(permitted_param))
  end

  private

  def permitted_param
    params.permit(:name, :unit_price, :description, :created_at, :updated_at, :merchant_id)
  end
end
