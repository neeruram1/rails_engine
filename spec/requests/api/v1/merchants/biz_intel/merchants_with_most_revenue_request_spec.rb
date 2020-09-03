require 'rails_helper'
describe "It outputs a list of merchants with most revenue" do
  it "returns the merchants with the most revenue" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    customer1 = create(:customer)
    item1 = create(:item, merchant: merchant1)
    item2 = create(:item, merchant: merchant2)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice3 = create(:invoice, customer: customer1, merchant: merchant2)
    invoice4 = create(:invoice, customer: customer1, merchant: merchant2)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item: item1, unit_price: 45.78, quantity: 40)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item: item1, unit_price: 45.78, quantity: 100)
    invoice_item3 = create(:invoice_item, invoice: invoice3, item: item2, unit_price: 63.50, quantity: 27)
    invoice_item4 = create(:invoice_item, invoice: invoice4, item: item2, unit_price: 34.00, quantity: 12)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)
    transaction4 = create(:transaction, invoice: invoice4)

    value = 2

    get "/api/v1/merchants/most_revenue?quantity=#{value}"

    expect(response).to be_successful
    response.content_type == "application/json"

    json = JSON.parse(response.body)

    expect(json["data"][0]["attributes"]["name"]).to eq(merchant1.name.to_s)
    expect(json["data"][0]["id"]).to eq(merchant1.id.to_s)
    expect(json["data"][1]["attributes"]["name"]).to eq(merchant2.name.to_s)
    expect(json["data"][1]["id"]).to eq(merchant2.id.to_s)
    expect(json["data"].length).to eq(2)
  end
end
