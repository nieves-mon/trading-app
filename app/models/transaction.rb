class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  enum kind: [ :buy, :sell ]

  validates :kind, :quantity, :price, :amount, presence: true
  validates :quantity, numericality: {greater_than: 0, only_integer: true}

  def calculate_amount
    (self.quantity.to_i * self.price.to_f).round(2)
  end
end
