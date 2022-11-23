FactoryBot.define do
  factory :user, class: 'User' do
    email { 'test@test.com' }
    password { '123456'}
    confirmed_at { Date.today }
    approved { true }
    admin { false }

    # Skips specific callback when building
    after(:build) do |user|
      user.class.skip_callback(:create)
    end
  end

  trait :skip_validations do
    to_create { |instance| instance.save(validate: false) }
  end

  trait :admin do
    email { 'admin@admin.com' }
    password { 'password' }
    confirmed_at { Date.today }
    approved { true }
    admin { true }
  end

  factory :pending_user, class: 'User' do
    email { 'pending@test.com' }
    password { 'pending' }
    confirmed_at { Date.today }
    approved { false }
    admin { true }   

    # Skips specific callback when building
    after(:build) do |user|
      user.class.skip_callback(:create)
    end
  end

end