class Api::V1::Items::SearchController < ApplicationController
  def show
    # items = Item.arel_table
    # Item.where(items[:name].matches("%#{params[:name]}%"))
    render json: ItemSerializer.new(Item.where("name ILIKE ?", "%#{params[:name]}%").first)
  end
end
