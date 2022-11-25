require 'rails_helper'

RSpec.describe "Traders", type: :system do
  before do
    driven_by(:rack_test)
  end

  def trader_login(user)
    login_as(user, scope: :user)
  end

  context "traders' account" do
    user = FactoryBot.create(:user)
    stock = Stock.create(symbol: 'MSFT', name: 'Microsoft Corporation')

    it 'lets you show trending stocks' do
      expect(user.admin).to eq(false)
      trader_login(user)
      visit trending_stocks_path
      expect(page).to have_content('Trending Stocks')
    end

    it 'lets you show trader portfolio' do
      expect(user.admin).to eq(false)
      trader_login(user)
      visit traders_portfolio_path
      expect(page).to have_content('My Portfolio')
    end

    it 'lets you search stocks' do
      expect(user.admin).to eq(false)
      trader_login(user)
      visit new_stock_path
      expect(page).to have_content('Search Stock')
      fill_in 'symbol', with: stock.symbol
      click_on 'Search Stock'
      expect(page).to have_content(stock.symbol)
      expect(page).to have_content(stock.name)
    end
  end

end
