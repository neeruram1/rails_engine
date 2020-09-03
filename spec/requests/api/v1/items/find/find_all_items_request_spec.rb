require 'rails_helper'
describe 'Find all items that match a set of criteria' do
  it "finds all items that contain a name fragment" do

    create_list(:item, 10, name: "Chocolate Frog")

    attribute = "name"
    query = "COL"

    get "/api/v1/items/find_all?#{attribute}=#{query}"

    expect(response).to be_successful

    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(10)
  end

  it "finds all items that contain a description fragment" do

    create_list(:item, 14, description: "Delicious and nutricious.")

    attribute = "description"
    query = "ici"

    get "/api/v1/items/find_all?#{attribute}=#{query}"

    expect(response).to be_successful

    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(14)
  end

  it "finds all items that contain a unit_price fragment" do

    create_list(:item, 45, unit_price: 100.32)
    create_list(:item, 20, unit_price: 40.32)

    attribute = "unit_price"
    query = 0.32

    get "/api/v1/items/find_all?#{attribute}=#{query}"

    expect(response).to be_successful

    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(65)
  end

  it "finds all items that have the same merchant id" do

    id = create(:merchant, id: 3).id
    create_list(:item, 20, merchant_id: 3)

    attribute = "merchant_id"
    query = id

    get "/api/v1/items/find_all?#{attribute}=#{query}"

    expect(response).to be_successful

    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(20)
  end

  it "finds all items with created_at, fragment " do
    create_list(:item, 40, created_at: "'Wed, 28 Apr 2010 12:00:00 UTC +00:00'")
    create_list(:item, 34, created_at: "'Sun, 02 Aug 2020 12:00:00 UTC +00:00'")

    attribute = "created_at"
    query = "28"

    get "/api/v1/items/find_all?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(40)
  end

  it "finds all items with updated_at, fragment " do
    create_list(:item, 12, updated_at: "'Wed, 28 Apr 2010 12:00:00 UTC +00:00'")
    create_list(:item, 32, updated_at: "'Sun, 02 Aug 2020 12:00:00 UTC +00:00'")

    attribute = "updated_at"
    query = "02"

    get "/api/v1/items/find_all?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(32)
  end
end
