FactoryBot.define do
  factory :savings_account do
    interest_rate { BigDecimal("1.23") }

    factory :savings_account_sample do
      interest_rate { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
    end

    after :build do |obj|
      obj.asset = build(:asset_super)
    end
  end
end
