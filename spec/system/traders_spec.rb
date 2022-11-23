require 'rails_helper'

RSpec.describe "Traders", type: :system do
  before do
    driven_by(:rack_test)
  end

  #pending "add some scenarios (or delete) #{__FILE__}"

  let!(:user) { create(:user) }

  def trader_login
    login_as(user, scope: :user)
  end

  it 'lets you show trader portfolio' do
    expect(user.admin).to eq(false)
    trader_login
    visit traders_portfolio_path
    expect(page).to have_content('My Portfolio')
  end

  it 'lets you search stock' do
    expect(user.admin).to eq(false)
    trader_login
    visit new_stock_path
    expect(page).to have_content('Search Stock')
    fill_in 'symbol', with: 'AMZN'
    click_on 'Search Stock'
    expect(page).to have_content('AMZN')
  end

end
