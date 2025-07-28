FactoryBot.define do
  factory :property do
    appreciation_rate { BigDecimal("1.23") }
    kind_id { 1 }

    factory :property_sample do
      appreciation_rate { BigDecimal("%d.%02d" % [ rand(5), rand(100) ]) }
      kind_id { rand(4) + 1 }
    end

    after :build do |obj|
      obj.asset = build(:asset_super)
    end
  end
end
