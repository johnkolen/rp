FactoryBot.define do
  factory :checking_account do
    interest_rate { BigDecimal("1.23") }

    factory :checking_account_sample do
      interest_rate { BigDecimal("%d.%02d" % [rand(2), rand(100)]) }
    end
  end
end
