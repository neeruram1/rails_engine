class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: ItemSerializer.new(Item.find_single_item(params[:name]))
  end
end
