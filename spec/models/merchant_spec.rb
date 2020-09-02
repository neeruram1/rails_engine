require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many(:customers).through(:invoices)}
    it {should have_many(:invoice_items).through(:invoices)}
    it {should have_many(:transactions).through(:invoices)}
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

      it ".total_revenue" do
        merchant = Merchant.create!(name: "The Bluth Company")
        item = Item.create!(name: "Banana", unit_price: 10.75, description: "A banana", merchant: merchant)
        item2 = Item.create!(name: "Chocolate Frog", unit_price: 4.75, description: "A chocolate frog", merchant: merchant)
        customer = Customer.create!(first_name: "Michael", last_name: "Bluth")
        customer2 = Customer.create!(first_name: "Job", last_name: "Bluth")
        invoice = Invoice.create!(customer: customer, merchant: merchant, status: 'shipped')
        invoice2 = Invoice.create!(customer: customer2, merchant: merchant, status: 'shipped')
        invoice_item = InvoiceItem.create!(quantity: 30, unit_price: item.unit_price, item: item, invoice: invoice)
        invoice_item2 = InvoiceItem.create!(quantity: 14, unit_price: item2.unit_price, item: item2, invoice: invoice2)
        transaction = Transaction.create!(credit_card_number: 123, result: "success", invoice: invoice)
        transaction1 = Transaction.create!(credit_card_number: 123, result: "failure", invoice: invoice)
        transaction2 = Transaction.create!(credit_card_number: 123, result: "success", invoice: invoice2)
        transaction3 = Transaction.create!(credit_card_number: 123, result: "failure", invoice: invoice2)
        expect(merchant.total_revenue).to eq(389.0)
        expect((10.75 * 30) + (4.75 * 14)).to eq(389)
      end

      it ".most_revenue()" do
        merchant1 = create(:merchant)
        merchant2 = create(:merchant)
        customer1 = create(:customer)
        item1 = create(:item, merchant: merchant1)
        item2 = create(:item, merchant: merchant2)
        invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
        invoice2 = create(:invoice, customer: customer1, merchant: merchant1)
        invoice3 = create(:invoice, customer: customer1, merchant: merchant2)
        invoice4 = create(:invoice, customer: customer1, merchant: merchant2)
        invoice_item1 = create(:invoice_item, invoice: invoice1, item: item1, unit_price: 45.78, quantity: 40)
        invoice_item2 = create(:invoice_item, invoice: invoice2, item: item1, unit_price: 45.78, quantity: 100)
        invoice_item3 = create(:invoice_item, invoice: invoice3, item: item2, unit_price: 63.50, quantity: 27)
        invoice_item4 = create(:invoice_item, invoice: invoice4, item: item2, unit_price: 34.00, quantity: 12)
        transaction1 = create(:transaction, invoice: invoice1)
        transaction2 = create(:transaction, invoice: invoice2)
        transaction3 = create(:transaction, invoice: invoice3)
        transaction4 = create(:transaction, invoice: invoice4)

        param = 2

        expect(Merchant.most_revenue(param)).to eq([merchant1, merchant2])
      end

      it ".most_items_sold" do
        merchant1 = create(:merchant)
        merchant2 = create(:merchant)
        merchant3 = create(:merchant)
        customer1 = create(:customer)
        item1 = create(:item, merchant: merchant1)
        item2 = create(:item, merchant: merchant2)
        item3 = create(:item, merchant: merchant3)
        item4 = create(:item, merchant: merchant3)
        invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
        invoice2 = create(:invoice, customer: customer1, merchant: merchant2)
        invoice3 = create(:invoice, customer: customer1, merchant: merchant3)
        invoice_item1 = create(:invoice_item, invoice: invoice1, item: item1, quantity: 40)
        invoice_item2 = create(:invoice_item, invoice: invoice2, item: item2, quantity: 100)
        invoice_item3 = create(:invoice_item, invoice: invoice3, item: item2, quantity: 27)
        invoice_item4 = create(:invoice_item, invoice: invoice1, item: item3, quantity: 12)
        transaction1 = create(:transaction, invoice: invoice1)
        transaction2 = create(:transaction, invoice: invoice2)
        transaction3 = create(:transaction, invoice: invoice3)

        param = 3

        expect(Merchant.most_items_sold(param)).to eq([merchant2, merchant1, merchant3])
      end
    end
  end
