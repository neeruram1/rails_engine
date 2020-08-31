require 'rails_helper'
describe 'Merchants API' do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]
    expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]

    expect(merchant["id"]).to eq(id.to_s)
  end

  xit "can create a new merchant" do

  end

  xit "can update an existing merchant" do

  end

  xit "can destroy a merchant" do

  end


end
