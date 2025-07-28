FactoryBot.define do
  factory :income do
    name { "General Income" }
    value { BigDecimal("1.23") }
    notes { "notes" }
    location { "location" }

    trait :employment do
      association :incomeable, factory: :employment
    end

    factory :income_sample do
      name { Faker::Alphanumeric.alphanumeric(number: 10) }
      value { BigDecimal("%d.%02d" % [ rand(100), rand(100) ]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Alphanumeric.alphanumeric(number: 10) }
      association :incomeable, factory: :employment
    end

    factory :income_super do
      name { "Some Income"  }
      value { BigDecimal("%d.%02d" % [ rand(100), rand(100) ]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Bank.name }
    end

    after :build do |income|
      unless income.person_id
        income.person_id = create(:person_sample).id
      end
    end
  end
end
