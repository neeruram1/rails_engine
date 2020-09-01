require 'rails_helper'
describe 'Find a single item with specific criteria' do
  it "searches for item by name, case insensitive fragment" do
    item1 = create(:item, name: 'Banana')
    item2 = create(:item, name: 'Chocolate')
    item3 = create(:item, name: 'Nana')

    attribute = "name"
    query = "NANA"

    get "/api/v1/items/find?#{attribute}=#{query}"

    expect(response).to be_successful

    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(item1.id.to_s)
  end

  it "searches for item by description, case insensitive fragment " do
    item1 = create(:item, description: 'A cool banana on a hot day is great.')
    item2 = create(:item, description: 'Chocolate frogs are good for the digestive system.')

    attribute = "description"
    query = "good for"

    get "/api/v1/items/find?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(item2.id.to_s)
  end

  it "searches for item by unit price, fragment " do
    item1 = create(:item, unit_price: 12.50)
    item2 = create(:item, unit_price: 345.65)

    attribute = "unit_price"
    query = 45.6

    get "/api/v1/items/find?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(item2.id.to_s)
  end

  it "searches for item by created_at, fragment " do
    item1 = create(:item, created_at: "'Wed, 28 Apr 2010 12:00:00 UTC +00:00'")
    item2 = create(:item, created_at: "'Sun, 02 Aug 2020 12:00:00 UTC +00:00'")

    attribute = "created_at"
    query = "28"

    get "/api/v1/items/find?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(item1.id.to_s)
  end

  it "searches for item by updated_at, fragment " do
    item1 = create(:item, updated_at: "'Wed, 28 Apr 2010 12:00:00 UTC +00:00'")
    item2 = create(:item, updated_at: "'Sun, 02 Aug 2020 12:00:00 UTC +00:00'")

    attribute = "updated_at"
    query = "02"

    get "/api/v1/items/find?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(item2.id.to_s)
  end
end
