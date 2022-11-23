class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0, only_integer: true}
end
