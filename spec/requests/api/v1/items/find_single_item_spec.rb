require 'rails_helper'
describe 'Find a single item with specific criteria' do
  it "searches for item by name, case insensitive" do
    item1 = create(:item, name: 'Banana')
    item2 = create(:item, name: 'Chocolate')

    get "/api/v1/items/find?name=NANA"

    expect(response).to be_successful

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(item1.id.to_s)
  end
end
