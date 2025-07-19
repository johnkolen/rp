FactoryBot.define do
  factory :user do
    email { "user@xyz.com" }
    password { "password" }
    password_confirmation { "password" }

    factory :user_sample do
      email { Faker::Internet.email }
      password { "sample" }
      password_confirmation { "sample" }
    end
  end
end
