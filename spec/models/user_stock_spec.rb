require 'rails_helper'

RSpec.describe UserStock, type: :model do
  user = FactoryBot.create(:user)
  stock = FactoryBot.create(:stock)

  context "when params are valid" do
    it "is valid with complete attribute and quantity is 0" do
      expect(UserStock.new(user: user, stock: stock, quantity: 0)).to be_valid
    end
    it "is valid with complete attribute and quantity is more than 0" do
      expect(UserStock.new(user: user, stock: stock, quantity: 4)).to be_valid
    end
  end

  context "when params are invalid" do
    it "is not valid if quantity is less than 0" do
      expect(UserStock.new(user: user, stock: stock, quantity: -1)).not_to be_valid
    end
  end

  context "when params are incomplete" do
    it "is not valid if user is nil" do
      expect(UserStock.new(user: nil, stock: stock, quantity: 1)).not_to be_valid
    end
    it "is not valid if stock is nil" do
      expect(UserStock.new(user: user, stock: nil, quantity: 1)).not_to be_valid
    end
    it "is not valid if quantity is nil" do
      expect(UserStock.new(user: user, stock: stock, quantity: nil)).not_to be_valid
    end
  end
end
