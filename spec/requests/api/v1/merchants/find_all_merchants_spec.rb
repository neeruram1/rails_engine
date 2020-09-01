require 'rails_helper'
describe 'Find a single merchant with specific criteria' do
  it "searches for merchant by name, case insensitive" do
    create_list(:merchant, 43, name: 'The Bluth Company')

    query = "company"
    attribute = "name"

    get "/api/v1/merchants/find_all?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(43)
  end

  it "searches for merchant by created_at, fragment " do
    create_list(:merchant, 23, created_at: "'Wed, 28 Apr 2010 12:00:00 UTC +00:00'")

    attribute = "created_at"
    query = "28"

    get "/api/v1/merchants/find_all?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(23)
  end

  it "searches for merchant by updated_at, fragment " do
    create_list(:merchant, 54, updated_at: "'Sun, 02 Aug 2020 12:00:00 UTC +00:00'")

    attribute = "updated_at"
    query = "02"

    get "/api/v1/merchants/find_all?#{attribute}=#{query}"

    expect(response).to be_successful
    response.content_type == "application/json"

    result = JSON.parse(response.body)

    expect(result["data"].count).to eq(54)
  end
end
