require 'rails_helper'

RSpec.describe "Traders", type: :system do
  before do
    driven_by(:rack_test)
  end

  #pending "add some scenarios (or delete) #{__FILE__}"

  let!(:user) { create(:user) }
  let!(:stock) { create(:stock) }

  def trader_login
    login_as(user, scope: :user)
  end

  it 'lets you show trending stocks' do
    expect(user.admin).to eq(false)
    trader_login
    visit trending_stocks_path
    expect(page).to have_content('Trending Stocks')
  end

  it 'lets you show trader portfolio' do
    expect(user.admin).to eq(false)
    trader_login
    visit traders_portfolio_path
    expect(page).to have_content('My Portfolio')
  end

  it 'lets you search stocks' do
    expect(user.admin).to eq(false)
    trader_login
    visit new_stock_path
    expect(page).to have_content('Search Stock')
    fill_in 'symbol', with: stock.symbol
    click_on 'Search Stock'
    expect(page).to have_content(stock.symbol)
    expect(page).to have_content(stock.name)
  end

end
