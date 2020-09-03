require 'rails_helper'
describe "Find a single merchant's total revenue" do
  it "returns the total revenue for a single merchant" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    customer1 = create(:customer)
    item1 = create(:item, merchant: merchant1)
    item2 = create(:item, merchant: merchant2)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1, created_at: "'Fri, 04 Sep 2020 05:00:00 UTC +00:00'")
    invoice2 = create(:invoice, customer: customer1, merchant: merchant1, created_at: "'Thu, 03 Sep 2020 05:10:00 UTC +00:00'")
    invoice3 = create(:invoice, customer: customer1, merchant: merchant2, created_at: "'Wed, 28 Apr 2010 05:00:00 UTC +00:00'")
    invoice4 = create(:invoice, customer: customer1, merchant: merchant2, created_at: "'Fri, 04 Sep 2020 07:00:00 UTC +00:00'")
    invoice_item1 = create(:invoice_item, invoice: invoice1, item: item1, unit_price: 45.78, quantity: 40)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item: item1, unit_price: 45.78, quantity: 100)
    invoice_item3 = create(:invoice_item, invoice: invoice3, item: item2, unit_price: 63.50, quantity: 27)
    invoice_item4 = create(:invoice_item, invoice: invoice4, item: item2, unit_price: 34.00, quantity: 12)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)
    transaction4 = create(:transaction, invoice: invoice4)

    start_date = "2020-09-03"
    end_date = "2020-09-04"

    get "/api/v1/revenue?start=#{start_date}&end=#{end_date}"

    expect(response).to be_successful
    response.content_type == "application/json"

    json = JSON.parse(response.body)

    expect(json["data"]["id"]).to eq(nil)
    expect(json["data"]["attributes"]["revenue"]).to eq(6817.2)
  end
end
