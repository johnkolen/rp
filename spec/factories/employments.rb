FactoryBot.define do
  factory :employment do
    gross { "1000.00" }
    taxable_status_id { 1 }
    ssi { true }
    raise_rate { "9.99" }
    start_date { Date.parse("2020-07-24") }
    final_date { Date.parse("2050-07-24") }

    factory :employment_sample do
      gross { "9.99" }
      taxable_status_id { rand(3) + 1 }
      ssi { true }
      raise_rate { "9.99" }
      transient do
        sd { Date.today - rand(10 * 365).days }
      end
      start_date { sd }
      final_date { sd + 30.years }
    end

    after :build do |obj|
      obj.income = build(:income_super)
    end
  end
end
