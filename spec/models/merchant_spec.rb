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
      it ".find_single_merchant()" do
        merchant1 = create(:merchant, name: 'The Bluth Company')
        merchant2 = create(:merchant, name: 'Dunder Mifflin Paper Company')
        merchant3 = create(:merchant, name: "Honeydukes")

      expect(Merchant.find_merchant("company")).to eq(merchant1)
    end
  end
end
