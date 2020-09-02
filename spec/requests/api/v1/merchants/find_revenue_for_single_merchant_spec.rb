require 'rails_helper'
describe "Find a single merchant's total revenue" do
  it "returns the total revenue for a single merchant" do
    merchant = Merchant.create!(name: "The Bluth Company")
    item = Item.create!(name: "Banana", unit_price: 10.75, description: "A banana", merchant: merchant)
    item2 = Item.create!(name: "Chocolate Frog", unit_price: 4.75, description: "A chocolate frog", merchant: merchant)
    customer = Customer.create!(first_name: "Michael", last_name: "Bluth")
    customer2 = Customer.create!(first_name: "Job", last_name: "Bluth")
    invoice = Invoice.create!(customer: customer, merchant: merchant, status: 'shipped')
    invoice2 = Invoice.create!(customer: customer2, merchant: merchant, status: 'shipped')
    invoice_item = InvoiceItem.create!(quantity: 30, unit_price: item.unit_price, item: item, invoice: invoice)
    invoice_item2 = InvoiceItem.create!(quantity: 14, unit_price: item2.unit_price, item: item2, invoice: invoice2)
    transaction = Transaction.create!(credit_card_number: 123, result: "success", invoice: invoice)
    transaction1 = Transaction.create!(credit_card_number: 123, result: "failure", invoice: invoice)
    transaction2 = Transaction.create!(credit_card_number: 123, result: "success", invoice: invoice2)
    transaction3 = Transaction.create!(credit_card_number: 123, result: "failure", invoice: invoice2)


    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_successful
    response.content_type == "application/json"

    json = JSON.parse(response.body)

    expect(json["data"]["id"]).to eq("null")
    expect(json["data"]["attributes"]["revenue"]).to eq(389.0)
  end
end
