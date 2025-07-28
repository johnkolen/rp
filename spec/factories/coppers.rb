FactoryBot.define do
  factory :copper do
    weight_kg { BigDecimal("1.23") }

    factory :copper_sample do
      weight_kg { BigDecimal("%d.%02d" % [ rand(100), rand(100) ]) }
end
  after :build do |obj|
    obj.asset = build(:asset_super)
  end
  end
end
