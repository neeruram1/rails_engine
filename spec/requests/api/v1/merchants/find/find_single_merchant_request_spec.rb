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
    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(merchant1.id.to_s)
  end

  it "searches for merchant by created_at, fragment " do
    merchant1 = create(:merchant, created_at: "'Wed, 28 Apr 2010 12:00:00 UTC +00:00'")
    merchant2 = create(:merchant, created_at: "'Sun, 02 Aug 2020 12:00:00 UTC +00:00'")

    attribute = "created_at"
    query = "28"

    get "/api/v1/merchants/find?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(merchant1.id.to_s)
  end

  it "searches for merchant by updated_at, fragment " do
    merchant1 = create(:merchant, updated_at: "'Wed, 28 Apr 2010 12:00:00 UTC +00:00'")
    merchant2 = create(:merchant, updated_at: "'Sun, 02 Aug 2020 12:00:00 UTC +00:00'")

    attribute = "updated_at"
    query = "02"

    get "/api/v1/merchants/find?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)["data"]

    expect(result["id"]).to eq(merchant2.id.to_s)
  end
end
