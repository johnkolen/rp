require 'rails_helper'

RSpec.describe Simulator, type: :model do
  it { expect(Simulator.new).to be_a Simulator }
  it "case 1" do
    person = create(:person)

    assets = [
      asset(CheckingAccount, person: person, value: 1000),
      house = asset(Property, person: person, value: 300000,
                    appreciation_rate: 1,
                    kind_id: Property::KindPrimaryResidence),
      asset(Equity, person: person, value: 100000,
            name: "SPY", return_rate: 10, beta: 1.0)
    ]

    liabilities = [
      # =PMT(0.06/12,360,300000*0.8)
      liability(FixedRateMortgage,
                value: 200000,
                person: person,
                property: house,
                pi_payment: 1438.92,
                interest_rate: 6)
    ]

    incomes = [
      income(Employment,
             gross: 100000,
             taxable_status_id: Employment::TaxableStatusSingle,
             ssi: true,
             raise_rate: 2.5,
             start_date: Date.new(2024, 8, 1),
             final_date: Date.new(2035, 8, 1),
             person: person)
    ]

    expenses = [
      Expense.new(amount: 1000.00,
                  frequency_id: Expense::FrequencyMonthly,
                  person: person)
    ]
    sim = Simulator.new assets: assets,
                        liabilities: liabilities,
                        incomes: incomes,
                        expenses: expenses
    sim.run
  end

  def split_options klass, **options
    koptions = {}
    xoptions = {}
    names = klass.attribute_names
    obj = klass.new
    options.keys.each do |key|
      if names.member?(key.to_s) || names.member?("#{key}_id")
        koptions[key] = options[key]
      else
        xoptions[key] = options[key]
      end
    end
    [koptions, xoptions]
  end

  def asset klass, **options
    koptions, aoptions = split_options klass, **options
    a = Asset.create!(assetable: klass.new(**koptions), **aoptions)
    a.assetable
  end

  def income klass, **options
    koptions, aoptions = split_options klass, **options
    Income.create!(incomeable: klass.new(**koptions), **aoptions).incomeable
  end

  def liability klass, **options
    koptions, aoptions = split_options klass, **options
    Liability.create!(liabilityable: klass.new(**koptions), **aoptions).liabilityable
  end

  def expense klass, **options
    koptions, aoptions = split_options klass, **options
    Expense.create!(expenseable: klass.new(**koptions), **aoptions).expenseable
  end
end
