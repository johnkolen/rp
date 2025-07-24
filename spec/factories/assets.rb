FactoryBot.define do
  factory :asset do
    # assetable_type { "string" }
    # assetable_id { 1 }
    name { "Generic Asset" }
    value { BigDecimal("1.23") }
    notes { "notes" }
    location { "location" }

    trait :checking_account do
      association :assetable, factory: :checking_account
    end

    factory :asset_sample do
      #assetable_type { Faker::Alphanumeric.alphanumeric(number: 10) }
      #assetable_id { rand(1000) }
      name { "Some Asset"  }
      value { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Bank.name }
      association :assetable, factory: :checking_account
    end

    factory :asset_super do
      name { "Some Asset"  }
      value { BigDecimal("%d.%02d" % [rand(100), rand(100)]) }
      notes { Faker::Alphanumeric.alphanumeric(number: 10) }
      location { Faker::Bank.name }
    end

    after :build do |asset|
      unless asset.person_id
        asset.person_id = create(:person_sample).id
      end
    end
  end
end
