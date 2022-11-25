require 'rails_helper'

RSpec.describe Transaction, type: :model do
  user = FactoryBot.create(:user)
  stock = FactoryBot.create(:stock)

  context "when params are valid" do
    it "is valid with valid attributes" do
      expect(Transaction.new(kind: 0, quantity: 1, price: 89.9, amount: 89.9, stock: stock, user: user)).to be_valid
    end
  end

  context "when params are invalid" do
    it "is not valid if quantity is 0" do
      expect(Transaction.new(kind: 0, quantity: 0, price: 89.9, amount: 89.9, stock: stock, user: user)).not_to be_valid
    end
    it "is not valid if quantity is less than 0" do
      expect(Transaction.new(kind: 0, quantity: -1, price: 89.9, amount: 89.9, stock: stock, user: user)).not_to be_valid
    end
    it "is not valid if quantity is not an integer" do
      expect(Transaction.new(kind: 0, quantity: 1.2, price: 89.9, amount: 107.88, stock: stock, user: user)).not_to be_valid
    end
  end

  context "when params are incomplete" do
    it "is not valid without kind" do
      expect(Transaction.new(quantity: 1, price: 89.9, amount: 89.9, stock: stock, user: user)).not_to be_valid
    end
    it "is not valid without quantity" do
      expect(Transaction.new(kind: 0, price: 89.9, amount: 89.9, stock: stock, user: user)).not_to be_valid
    end
    it "is not valid without price" do
      expect(Transaction.new(kind: 0, quantity: 1, amount: 89.9, stock: stock, user: user)).not_to be_valid
    end
    it "is not valid without amount" do
      expect(Transaction.new(kind: 0, quantity: 1, price: 89.9, stock: stock, user: user)).not_to be_valid
    end
    it "is not valid without user" do
      expect(Transaction.new(kind: 0, quantity: 1, price: 89.9, amount: 89.9, stock: stock)).not_to be_valid
    end
    it "is not valid without stock" do
      expect(Transaction.new(kind: 0, quantity: 1, price: 89.9, amount: 89.9, user: user)).not_to be_valid
    end
  end
end
