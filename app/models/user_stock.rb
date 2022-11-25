class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0, only_integer: true}
  attribute :quantity, default: 0

  def calculate_new_quantity(transaction_quantity, transaction_kind)
    if transaction_kind == "buy"
      self.quantity + transaction_quantity
    else
      self.quantity - transaction_quantity
    end
  end
end
