class Stock < ApplicationRecord
    has_many :transactions
    has_many :users, through: :transactions
    has_many :user_stocks
end
