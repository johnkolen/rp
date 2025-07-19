FactoryBot.define do
  factory :person do
    first_name { "Alex" }
    last_name { "Smith" }
    birthdate { Date.new(1970, 6, 29) }
    primary { true }
    user_id { create(:user_sample).id }

    factory :person_sample do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      birthdate { Faker::Date.between(from: 70.years.ago,
                                      to: 40.years.ago) }
      primary { true }
    end

    after :build do |person|
      unless person.user_id
        person.user_id = create(:user_sample).id
      end
    end
  end
end
