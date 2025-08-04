FactoryBot.define do
  factory :equity do
    return_rate { BigDecimal("1.23") }
    duration_id { 1 }
    beta { BigDecimal("1.23") }
    account_type_id { 1 }

    factory :equity_sample do
      return_rate { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
    duration_id { rand(1000) }
    beta { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
    account_type_id { rand(1000) }
end
  after :build do |obj|
    obj.asset = build(:asset_super)
  end

  end
end
