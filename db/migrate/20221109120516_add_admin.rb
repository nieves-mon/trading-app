class AddAdmin < ActiveRecord::Migration[7.0]
  def change
    User.new do |admin|
      admin.email = 'admin@admin.com'
      admin.password = 'password'
      admin.admin = true
      admin.approved = true
      admin.skip_confirmation!
      admin.save!
    end
  end
end