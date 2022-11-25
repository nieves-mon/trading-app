require 'rails_helper'

RSpec.describe Stock, type: :model do
  context "when params are valid" do
    it "is valid with valid attributes" do
      expect(Stock.new(symbol: "MSFT", name: "Microsoft Corporation")).to be_valid
    end
  end

  context "when params are invalid" do
    it "is invalid without symbol" do
      expect(Stock.new(symbol: nil, name: "Microsoft Corporation")).not_to be_valid
    end
    it "is invalid without name" do
      expect(Stock.new(symbol: "MSFT", name: nil)).not_to be_valid
    end
  end
end
