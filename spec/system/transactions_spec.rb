require 'rails_helper'

RSpec.describe "Transactions", type: :system do
  before do
    driven_by(:rack_test)
  end

<<<<<<< HEAD
  #pending "add some scenarios (or delete) #{__FILE__}"
    let(:buy_account) { create(:transaction, :buy) }
    let(:sell_account) { create(:transaction, :sell) }

  def buy_login
    login_as(buy_account.user)
  end

  def sell_login
    login_as(sell_account.user)
  end

  it 'lets trader buy stocks' do
    expect(buy_account.user.admin).to eq(false)
    buy_login
    visit buy_stock_path(buy_account.stock.symbol)
    fill_in 'transaction[quantity]', with: buy_account.quantity
    expect { click_on 'Buy Stock' }.to change(Transaction, :count).by(1)
  end

  it 'lets trader sell stocks' do
    expect(sell_account.user.admin).to eq(false)
    sell_login
    visit sell_stock_path(sell_account.stock.symbol)
    fill_in 'transaction[quantity]', with: sell_account.quantity
    expect { click_on 'Sell Stock' }.to change(Transaction, :count).by(1)
=======
  def trader_login(user)
    login_as(user)
  end

  context "trader transactions" do
    user = FactoryBot.create(:user)
    stock = Stock.create(symbol: 'TSLA', name: 'Tesla Inc.')

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
>>>>>>> 44201a8f6fb4cd2aea994227a35d7f0c9f729ac9
  end

end
