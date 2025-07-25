FactoryBot.define do
  factory :fixed_rate_mortgage do
    pi_payment { BigDecimal("1.23") }
    interest_rate { BigDecimal("1.23") }
    association :property, factory: :property
    final_date { Date.new(2025, 6, 29) }

    factory :fixed_rate_mortgage_sample do
      pi_payment { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
      interest_rate { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
      final_date { Faker::Date.between(from: Date.today + 5.years,
                                       to: Date.today + 28.years) }
    end

    after :build do |obj|
      obj.liability = build(:liability_super)
    end
  end
end
