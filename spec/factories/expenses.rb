FactoryBot.define do
  factory :expense do
    name { "General Expense" }
    amount { BigDecimal("1.23") }
    notes { "notes" }
    location { "location" }

    trait :property_tax do
      association :expenseable, factory: :property_tax
    end

    factory :expense_sample do
      name { Faker::Alphanumeric.alphanumeric(number: 10) }
      amount { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Alphanumeric.alphanumeric(number: 10) }
      association :expenseable, factory: :property_tax
    end

    factory :expense_super do
      name { "Some Expense"  }
      amount { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
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
