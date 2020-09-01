require 'rails_helper'
describe 'Find a single merchant with specific criteria' do
  it "searches for merchant by name, case insensitive" do
    merchant1 = create(:merchant, name: 'The Bluth Company')
    merchant2 = create(:merchant, name: 'Dunder Mifflin Paper Company')
    merchant3 = create(:merchant, name: "Honeydukes")

    query = "company"
    attribute = "name"

    get "/api/v1/merchants/find?#{attribute}=#{query}"

    expect(response).to be_successful

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(merchant1.id.to_s)
  end
end
