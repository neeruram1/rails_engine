class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :credit_card_number
      t.string :credit_card_expiration_date
      t.string :date

      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
