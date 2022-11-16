class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  enum kind: [ :buy, :sell ]

  validates :kind, :quantity, :price, presence: true
  validates :quantity, numericality: {greater_than: 0, only_integer: true}
end
