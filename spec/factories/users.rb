FactoryBot.define do
  factory :user do
    email { "string" }
    encrypted_password { "string" }
    reset_password_token { "string" }
    reset_password_sent_at { DateTime.new(2025, 6, 29, 8, 9, 10) }
    remember_created_at { DateTime.new(2025, 6, 29, 8, 9, 10) }

    factory :user_sample do
      email { Faker::Alphanumeric.alphanumeric(number: 10) }
    encrypted_password { Faker::Alphanumeric.alphanumeric(number: 10) }
    reset_password_token { Faker::Alphanumeric.alphanumeric(number: 10) }
    reset_password_sent_at { DateTime.new(Faker::Time.between(from: 2.years.ago, to: Date.today)) }
    remember_created_at { DateTime.new(Faker::Time.between(from: 2.years.ago, to: Date.today)) }
    end
  end
end
