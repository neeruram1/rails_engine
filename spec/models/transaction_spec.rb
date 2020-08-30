require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :credit_card_number}
    it {should validate_numericality_of :credit_card_number}
    it {should validate_presence_of :result}
  end

  describe 'Relationships' do
    it {should belong_to :invoice}
    it {should have_one(:customer).through(:invoice)}
  end
end
