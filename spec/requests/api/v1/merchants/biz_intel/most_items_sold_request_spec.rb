require 'rails_helper'
describe "Find merchants with most items sold" do
  it "returns the merchants with most items sold" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
    customer1 = create(:customer)
    item1 = create(:item, merchant: merchant1)
    item2 = create(:item, merchant: merchant2)
    item3 = create(:item, merchant: merchant3)
    item4 = create(:item, merchant: merchant3)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant2)
    invoice3 = create(:invoice, customer: customer1, merchant: merchant3)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item: item1, quantity: 40)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item: item2, quantity: 100)
    invoice_item3 = create(:invoice_item, invoice: invoice3, item: item2, quantity: 27)
    invoice_item4 = create(:invoice_item, invoice: invoice1, item: item3, quantity: 12)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)

    param = 3

    get "/api/v1/merchants/most_items?quantity=#{param}"

    expect(response).to be_successful
    response.content_type == "application/json"

    json = JSON.parse(response.body)

    expect(json["data"][0]["attributes"]["name"]).to eq(merchant2.name.to_s)
    expect(json["data"][0]["id"]).to eq(merchant2.id.to_s)
    expect(json["data"][1]["attributes"]["name"]).to eq(merchant1.name.to_s)
    expect(json["data"][1]["id"]).to eq(merchant1.id.to_s)
    expect(json["data"][2]["attributes"]["name"]).to eq(merchant3.name.to_s)
    expect(json["data"][2]["id"]).to eq(merchant3.id.to_s)
    expect(json["data"].length).to eq(3)
  end
end
