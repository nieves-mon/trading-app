require 'rails_helper'

RSpec.describe "Transactions", type: :system do
  before do
    driven_by(:rack_test)
  end

  #pending "add some scenarios (or delete) #{__FILE__}"
  let(:buy_trader_account) { create(:transaction, :buy) }
  let(:sell_trader_account) { create(:transaction, :sell) }

  def buy_trader_login
    login_as(buy_trader_account.user)
  end

  def sell_trader_login
    login_as(sell_trader_account.user)
  end

  it 'lets trader buy stocks' do
    expect(buy_trader_account.user.admin).to eq(false)
    buy_trader_login
    visit buy_stock_path(buy_trader_account.stock.symbol)
    fill_in 'transaction[quantity]', with: buy_trader_account.quantity
    click_on 'Buy Stock'
    expect(Transaction.count).to eq(2)
  end

  it 'lets trader sell stocks' do
    expect(sell_trader_account.user.admin).to eq(false)
    sell_trader_login
    visit sell_stock_path(sell_trader_account.stock.symbol)
    fill_in 'transaction[quantity]', with: sell_trader_account.quantity
    click_on 'Sell Stock'
    expect(Transaction.count).to eq(2)
  end

end
