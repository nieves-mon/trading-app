class RenameTypeToTransactionType < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :type, :transaction_type
  end
end
