class AddResultToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :result, :string
  end
end
