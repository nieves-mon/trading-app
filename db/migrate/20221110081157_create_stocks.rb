class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.float :price
      t.timestamps
    end
  end
end
