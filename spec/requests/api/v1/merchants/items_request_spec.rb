require 'rails_helper'
describe 'Return the Items associated with specific Merchant' do
  it "returns all items associated with a merchant" do
    item = create(:item)

    get "/api/v1/merchants/#{item.merchant.id}/items"

    expect(response).to be_successful
    response.content_type == "application/json"

    items = JSON.parse(response.body)["data"]

    expect(items.first["attributes"]["name"]).to eq(item.name)
  end
end
