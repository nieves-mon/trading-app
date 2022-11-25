require 'rails_helper'

RSpec.describe "Admins", type: :system do
  before do
    driven_by(:rack_test)
  end

  def admin_login(admin_account)
    login_as(admin_account, scope: :user)
  end

  context "admin account" do
    admin_account = FactoryBot.create(:user, :admin)
    user = FactoryBot.create(:user)
    pending_user = FactoryBot.create(:user, :pending)

    it 'lets you show all trader accounts' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit accounts_path
      expect(page).to have_content('All Accounts')
    end

    it 'lets you create new trader account' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit new_account_path
      expect(page).to have_content('New Trader Account')
      fill_in 'user[email]', with: 'sample@test.com'
      fill_in 'user[password]', with: 'sample'
      fill_in 'user[password_confirmation]', with: 'sample'
      click_on 'Submit'
      expect(page).to have_content('Account successfully added')
    end

    it 'lets you show trader account details' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit accounts_path
      expect(page).to have_content(user.email)
      click_on user.email
      expect(page).to have_content('Account Details')
      expect(page).to have_content('Account Status')
      expect(page).to have_content('Confirmation Status')
    end

    it 'lets you edit trader account details' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit edit_account_path(user)
      expect(page).to have_content('Edit Trader Account')
      fill_in 'user[email]', with: 'editedsample@test.com'
      click_on 'Submit'
      expect(page).to have_content('Account successfully updated')
    end

    it 'lets you delete trader account' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit account_path(user)
      click_on 'Delete'
      expect(page).to have_content('Account successfully deleted')
    end

    it 'lets you show all transactions' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit admin_path
      expect(page).to have_content('All Transactions')
    end

    it 'lets you show pending accounts' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit pending_account_path
      expect(page).to have_content('Pending Accounts')
      expect(page).to have_content(pending_user.email)
    end

    it 'lets you approve pending accounts' do
      expect(admin_account.admin).to eq(true)
      admin_login(admin_account)
      visit pending_account_path
      expect(page).to have_content(pending_user.email)
      click_on 'Approve', match: :first
      expect(page).to have_content('Account successfully approved')
    end
  end

end
