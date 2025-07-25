FactoryBot.define do
  factory :liability do
    name { "Generic Liability" }
    value { BigDecimal("1.23") }
    notes { "notes" }
    location { "location" }

    trait :fixed_rate_mortgage do
      association :liabilityable, factory: :fixed_rate_mortgage
    end

    factory :liability_sample do
      name { Faker::Alphanumeric.alphanumeric(number: 10) }
      value { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Alphanumeric.alphanumeric(number: 10) }
      association :liabilityable, factory: :fixed_rate_mortgage
    end

    factory :liability_super do
      name { Faker::Alphanumeric.alphanumeric(number: 10) }
      value { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Alphanumeric.alphanumeric(number: 10) }
    end

    after :build do |liability|
      unless liability.person_id
        liability.person = create(:person_sample)
      end
    end
  end
end
