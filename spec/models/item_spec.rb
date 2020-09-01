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
    it ".find_item()" do
      item1 = create(:item, name: 'Banana')
      item2 = create(:item, description: 'Chocolate')
      item3 = create(:item, name: 'Nana')
      param = {"name"=>"NANA"}
      param1 = {"description"=>"late"}

      expect(Item.find_item(param)).to eq(item1)
      expect(Item.find_item(param1)).to eq(item2)
    end

    it ".find_all_items()" do
      create_list(:item, 10, name: "Chocolate Frog")
      param = {"name"=>"COL"}

      expect(Item.find_all_items(param).count).to eq(10)
    end
  end
end
