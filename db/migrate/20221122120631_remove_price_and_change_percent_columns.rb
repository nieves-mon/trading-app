class RemovePriceAndChangePercentColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :stocks, :price
    remove_column :stocks, :change_percent
  end
end
