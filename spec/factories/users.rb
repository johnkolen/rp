FactoryBot.define do
  factory :user do
    email { "user@xyz.com" }
    password { "password" }
    password_confirmation { "password" }
    role_id { User::RoleUser }

    factory :admin_user do
      email { "admin@rp.com" }
      password { "password" }
      password_confirmation { "password" }
      role_id { User::RoleAdmin }
    end

    factory :user_sample do
      email { Faker::Internet.email }
      password { "sample" }
      password_confirmation { "sample" }
      role_id { User::RoleUser }
    end
  end
end
