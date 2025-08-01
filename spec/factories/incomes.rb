FactoryBot.define do
  factory :income do
    name { "General Income" }
    amount { BigDecimal("1.23") }
    notes { "notes" }
    location { "location" }
    start_date { Date.parse("2020-07-24") }
    final_date { Date.parse("2050-07-24") }

    trait :employment do
      association :incomeable, factory: :employment
    end

    factory :income_sample do
      name { Faker::Alphanumeric.alphanumeric(number: 10) }
      amount { BigDecimal("%d.%02d" % [ rand(100), rand(100) ]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Alphanumeric.alphanumeric(number: 10) }
      association :incomeable, factory: :employment
      transient do
        sd { Date.today - rand(10 * 365).days }
      end
      start_date { sd }
      final_date { sd + 30.years }
    end

    factory :income_super do
      name { "Some Income"  }
      amount { BigDecimal("%d.%02d" % [ rand(100), rand(100) ]) }
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
