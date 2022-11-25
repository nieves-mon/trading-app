require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "is valid with valid attributes"
  it "is not valid without kind"
  it "is not valid without quantity"
  it "is not valid without price"
  it "is not valid without amount"
  it "is not valid without user"
  it "is not valid without stock"
end
