require 'rails_helper'

RSpec.describe Equity, type: :model do
  it { expect(create(:equity)).to be_a Equity }
  it { expect(create(:equity_sample)).to be_a Equity }
  save_dt_from_params
  it "IRA penalties" do
    person = create(:person_sample)
    equity = create(:equity_sample)
    equity.person = person
    year = person.birthdate.year
    equity.update_value year + 58, -10000, 1
    expect(equity.penalties).to eq 1000
    expect(equity.asset.penalties).to eq 1000
    equity.update_value year + 61, -10000, 1
    expect(equity.penalties).to eq 0
    expect(equity.asset.penalties).to eq 0
    equity.update_value year + 59, -10000, 1
    #puts person.birthdate
    if 59.5 < person.age(Date.new(year + 59, 1, 1))
      expect(equity.penalties).to eq 0
    else
      expect(equity.penalties).to be_between(1, 1000)
    end
    equity.update_value year + 60, -10000, 1
    if 59.5 < person.age(Date.new(year + 60, 1, 1))
      expect(equity.penalties).to eq 0
    else
      expect(equity.penalties).to be_between(1, 1000)
    end
  end
end
