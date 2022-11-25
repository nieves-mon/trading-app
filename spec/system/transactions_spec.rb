require 'rails_helper'

RSpec.describe "Transactions", type: :system do
  before do
    driven_by(:rack_test)
  end

  def trader_login(user)
    login_as(user)
  end

  context "trader transactions" do
    user = FactoryBot.create(:user)
    stock = FactoryBot.create(:stock)

    it 'lets trader buy stocks' do
      expect(user.admin).to eq(false)
      trader_login(user)
      visit buy_stock_path(stock.symbol)
      fill_in 'transaction[quantity]', with: 10
      expect { click_on 'Buy Stock' }.to change(Transaction, :count).by(1)
    end

    it 'lets trader sell stocks' do
      expect(user.admin).to eq(false)
      trader_login(user)
      visit sell_stock_path(stock.symbol)
      fill_in 'transaction[quantity]', with: 10
      expect { click_on 'Sell Stock' }.to change(Transaction, :count).by(1)
    end
  end

end
