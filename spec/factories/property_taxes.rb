FactoryBot.define do
  factory :property_tax do
    increase_rate { BigDecimal("1.23") }

    factory :property_tax_sample do
      increase_rate { BigDecimal("%d.%02d" % [ rand(4), rand(100) ]) }
    end

    after :build do |obj|
      obj.expense = build(:expense_super)
      obj.property = build(:property_sample)
    end
  end
end
