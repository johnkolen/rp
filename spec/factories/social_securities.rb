FactoryBot.define do
  factory :social_security do
    benefit_at_62 { BigDecimal("1.23") }
    benefit_at_67 { BigDecimal("1.23") }
    benefit_at_70 { BigDecimal("1.23") }
    retirement_date { Date.new(2025, 6, 29) }

    factory :social_security_sample do
      benefit_at_62 { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
    benefit_at_67 { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
    benefit_at_70 { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
    retirement_date { Faker::Date.between(from: 2.years.ago, to: Date.today) }
end
  after :build do |obj|
    obj.income = build(:income_super)
  end

  end
end
