FactoryBot.define do
  factory :employment do
    gross { "1000.00" }
    taxable_status_id { 1 }
    ssi { true }
    raise_rate { "9.99" }

    factory :employment_sample do
      gross { "9.99" }
      taxable_status_id { rand(3) + 1 }
      ssi { true }
      raise_rate { "9.99" }
    end

    after :build do |obj|
      obj.income = build(:income_super)
    end
  end
end
