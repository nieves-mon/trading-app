FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { '123456'}
    confirmed_at { Date.today }
    approved { true }
    admin { false }

    after(:build) do |user|
      user.class.skip_callback(:create)
    end
  end

  trait :skip_validations do
    to_create { |instance| instance.save(validate: false) }
  end

  trait :admin do
    admin { true }
  end

  trait :pending do
    approved { false }
  end

end
