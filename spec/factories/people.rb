FactoryBot.define do
  factory :person do
    first_name { "string" }
    last_name { "string" }
    birthdate { Date.new(2025, 6, 29) }
    primary { true }
    user_id { 1 }

    factory :person_sample do
      first_name { Faker::Alphanumeric.alphanumeric(number: 10) }
    last_name { Faker::Alphanumeric.alphanumeric(number: 10) }
    birthdate { Date.new(Faker::Date.between(from: 2.years.ago, to: Date.today)) }
    primary { rand(2) == 1 }
    user_id { rand(1000) }
    end
  end
end
