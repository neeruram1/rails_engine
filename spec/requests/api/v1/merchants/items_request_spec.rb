require 'rails_helper'
describe 'Return the Items associated with specific Merchant' do
  it "returns all items associated with a merchant" do
    create_list(:item, 10)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"]).to eq(item.merchant.id.to_s)
  end
end
