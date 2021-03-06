require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful
    response.content_type == "application/json"

    items = JSON.parse(response.body)["data"]

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    response.content_type == "application/json"

    expect(item["id"]).to eq(id.to_s)
  end

  it "can create a new item" do
    merchant_id = create(:merchant).id
    item_params = { name: "Banana", description: "I like bananas from the banana stand", merchant_id: merchant_id, unit_price: 5.0}

    post "/api/v1/items", params: item_params
    item = Item.last

    expect(response).to be_successful
    response.content_type == "application/json"

    expect(item.name).to eq(item_params[:name])
  end

  it "can update an existing item" do
    merchant_id = create(:merchant).id
    id = create(:item).id
    previous_name = Item.last.name
    item_params = { name: "Chocolate Banana", description: "I like chocolate bananas from the banana stand", merchant_id: merchant_id, unit_price: 6.0}


    put "/api/v1/items/#{id}", params: item_params
    item = Item.find_by(id: id)

    expect(response).to be_successful
    response.content_type == "application/json"
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Chocolate Banana")
  end

  it "can destroy an item" do
    item = create(:item)

    expect{ delete "/api/v1/items/#{item.id}" }.to change(Item, :count).by(-1)

    expect(response).to be_successful
    response.content_type == "application/json"
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
