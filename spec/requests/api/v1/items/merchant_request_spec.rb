require 'rails_helper'
describe 'Return the Merchant associated with specific Item' do
  it "returns all merchants associated with an item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"]).to eq(item.merchant.id.to_s)
  end
end
