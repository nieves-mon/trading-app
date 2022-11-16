class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  enum kind: [ :buy, :sell ]
end
