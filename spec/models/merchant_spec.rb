require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many(:customers).through(:invoices)}
  end

  describe 'Methods' do
      it ".find_merchant()" do
        merchant1 = create(:merchant, name: 'The Bluth Company')
        merchant2 = create(:merchant, name: 'Dunder Mifflin Paper Company')
        param = {"name"=>"blu"}
        param1 = {"name"=>"MIFF"}

      expect(Merchant.find_merchant(param)).to eq(merchant1)
      expect(Merchant.find_merchant(param1)).to eq(merchant2)
    end

    it ".find_all_merchants()" do
      merchant1 = create_list(:merchant, 34, name: 'The Bluth Company')
      param = {"name"=>"blu"}

      expect(Merchant.find_all_merchants(param).count).to eq(34)
    end
  end
end
