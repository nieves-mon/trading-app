require 'rails_helper'

RSpec.describe Transaction, type: :model do

  context "when params are valid" do
    it "is valid with valid attributes as buy-transaction" do
      expect(build(:transaction, :buy)).to be_valid
    end
    it "is valid with valid attributes as sell-transaction" do
      expect(build(:transaction, :sell)).to be_valid
    end
  end

  context "when params are invalid" do
    it "is not valid if quantity is 0" do
      expect(build(:transaction, :buy, quantity: 0)).not_to be_valid
    end
    it "is not valid if quantity is less than 0" do
      expect(build(:transaction, :buy, quantity: -1)).not_to be_valid
    end
    it "is not valid if quantity is not an integer" do
      expect(build(:transaction, :buy, quantity: 1.2)).not_to be_valid
    end
  end

  context "when params are incomplete" do
    it "is not valid without kind" do
      expect(build(:transaction, kind: nil)).not_to be_valid
    end
    it "is not valid without quantity" do
      expect(build(:transaction, kind: 0, quantity: nil)).not_to be_valid
    end
    it "is not valid without price" do
      expect(build(:transaction, kind: 0, price: nil)).not_to be_valid
    end
    it "is not valid without amount" do
      expect(build(:transaction, kind: 0, amount: nil)).not_to be_valid
    end
    it "is not valid without user" do
      expect(build(:transaction, kind: 0, user: nil)).not_to be_valid
    end
    it "is not valid without stock" do
      expect(build(:transaction, kind: 0, stock: nil)).not_to be_valid
    end
  end
end
