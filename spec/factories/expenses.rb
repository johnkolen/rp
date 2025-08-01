FactoryBot.define do
  factory :expense do
    name { "General Expense" }
    amount { BigDecimal("1.23") }
    notes { "notes" }
    location { "location" }
    start_date { Date.parse("2020-07-24") }
    final_date { Date.parse("2080-07-24") }

    trait :property_tax do
      association :expenseable, factory: :property_tax
    end

    factory :expense_sample do
      name { Faker::Alphanumeric.alphanumeric(number: 10) }
      amount { BigDecimal("%d.%02d" % [ rand(100), rand(100) ]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Alphanumeric.alphanumeric(number: 10) }
      association :expenseable, factory: :property_tax
      transient do
        sd { Date.today - rand(10 * 365).days }
      end
      start_date { sd }
      final_date { sd + 100.years }
    end

    factory :expense_super do
      name { "Some Expense"  }
      amount { BigDecimal("%d.%02d" % [ rand(100), rand(100) ]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Bank.name }
    end

    after :build do |expense|
      unless expense.person_id
        expense.person_id = create(:person_sample).id
      end
    end
  end
end
