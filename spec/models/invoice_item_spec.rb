require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :unit_price}
    it {should validate_numericality_of :unit_price}
    it {should validate_numericality_of :quantity}
  end

  describe 'Relationships' do
    it {should belong_to :invoice}
    it {should belong_to :item}
  end
end
