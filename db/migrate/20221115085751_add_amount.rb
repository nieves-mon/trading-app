class AddAmount < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :amount, :integer
  end
end
