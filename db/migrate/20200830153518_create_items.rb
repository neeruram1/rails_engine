class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :unit_price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
