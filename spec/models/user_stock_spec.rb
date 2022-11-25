require 'rails_helper'

RSpec.describe UserStock, type: :model do
  context "when params are valid" do
    it "is valid with complete attribute and quantity is 0" do
      expect(build(:user_stock, quantity: 0)).to be_valid
    end
    it "is valid with complete attribute and quantity is more than 0" do
      expect(build(:user_stock, quantity: 1)).to be_valid
    end
    it "defaults quantity to 0 if not provided" do
      user_stock = build(:user_stock)
      expect(user_stock.quantity).to eq(0)
    end
  end

  context "when params are invalid" do
    it "is not valid if quantity is less than 0" do
      expect(build(:user_stock, quantity: -1)).not_to be_valid
    end
  end

  context "when params are incomplete" do
    it "is not valid if user is nil" do
      expect(build(:user_stock, user: nil)).not_to be_valid
    end
    it "is not valid if stock is nil" do
      expect(build(:user_stock, stock: nil)).not_to be_valid
    end
    it "is not valid if quantity is nil" do
      expect(build(:user_stock, quantity: nil)).not_to be_valid
    end
  end
end
