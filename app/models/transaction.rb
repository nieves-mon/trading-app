class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  enum kind: [ :buy, :sell ]

  validates :kind, :quantity, :price, :amount, presence: true
  validates :quantity, numericality: {greater_than: 0, only_integer: true}

  def calculate_amount
    (self.quantity.to_i * self.price.to_f).round(2)
  end

  def calculate_new_quantity(user_stock_quantity)
    if self.buy?
      user_stock_quantity + self.quantity
    else
      user_stock_quantity - self.quantity
    end
  end
end
