require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
    it {should validate_numericality_of :unit_price}
  end

  describe 'Relationships' do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
    it {should have_many(:invoices).through(:invoice_items)}
  end

  describe 'Methods' do
      it ".find_single_item()" do
        item1 = create(:item, name: 'Banana')
        item2 = create(:item, name: 'Chocolate')
        item3 = create(:item, name: 'Nana')

      expect(Item.find_single_item("NANA")).to eq(item1)
    end
  end
end
