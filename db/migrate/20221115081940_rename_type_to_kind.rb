class RenameTypeToKind < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :type, :kind
  end
end
