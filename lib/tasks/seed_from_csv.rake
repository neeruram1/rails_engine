require 'csv'

  namespace :seed_from_csv do
    desc "seed csv data"

    task rebuild: :environment do
      Rake::Task['db:drop'].execute
      Rake::Task['db:create'].execute
      Rake::Task['db:migrate'].execute
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
        Item.create!(row.to_hash)
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
        InvoiceItem.create!(row.to_hash)
      end
    end

    desc "seed"
    task transactions: :environment do
      csv_text = File.read('db/csv_seeds/transactions.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Transaction.create!(row.to_hash)
      end
    end

    task :all => [:rebuild, :customers, :merchants, :items, :invoices, :invoice_items, :transactions ]
  end
