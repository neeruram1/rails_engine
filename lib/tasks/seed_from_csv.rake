require 'csv'

  namespace :seed_from_csv do
    desc "seed csv data"

    task rebuild: :environment do
      Rake::Task['db:drop'].execute
      Rake::Task['db:create'].execute
      Rake::Task['db:migrate'].execute
    end

    task reset_key: :environment do
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
    end

    task merchants: :environment do
      csv_text = File.read('db/csv_seeds/merchants.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Merchant.create!(row.to_hash)
      end
    end

    task customers: :environment do
      csv_text = File.read('db/csv_seeds/customers.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Customer.create!(row.to_hash)
      end
    end

    task items: :environment do
      csv_text = File.read('db/csv_seeds/items.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Item.create!( {
          name: row['name'],
          description: row['description'],
          unit_price: (row['unit_price'].to_f * 0.01).round(2),
          merchant_id: row['merchant_id'],
          created_at: row['created_at'],
          updated_at: row['updated_at']
        } )
      end
    end

    task invoices: :environment do
      csv_text = File.read('db/csv_seeds/invoices.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|

        Invoice.create!(row.to_hash)
      end
    end

    task invoice_items: :environment do
      csv_text = File.read('db/csv_seeds/invoice_items.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        InvoiceItem.create!( {
          id: row['id'],
          item_id: row['item_id'],
          invoice_id: row['invoice_id'],
          quantity: row['quantity'],
          unit_price: (row['unit_price'].to_f * 0.01).round(2),
          created_at: row['created_at'],
          updated_at: row['updated_at']
        } )
      end
    end

    task transactions: :environment do
      csv_text = File.read('db/csv_seeds/transactions.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Transaction.create!(row.to_hash)
      end
    end

    task :all => [:rebuild, :merchants, :customers, :invoices, :transactions, :items, :invoice_items, :reset_key ]
  end
