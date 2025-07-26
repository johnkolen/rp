require 'rails_helper'

RSpec.describe FixedRateMortgage, type: :model do
  it { expect(create(:fixed_rate_mortgage)).to be_a FixedRateMortgage }
  it { expect(create(:fixed_rate_mortgage_sample)).to be_a FixedRateMortgage }
  it "save from params" do
    p = build(:fixed_rate_mortgage_sample).to_params
    puts p.inspect
    x = FixedRateMortgage.new(p)
    x.save!
    expect(x.save).to be true
    expect(x).to be_a FixedRateMortgage
    expect(x.liability).to be_a Liability
    expect(x.property).to be_a Property
  end
end
