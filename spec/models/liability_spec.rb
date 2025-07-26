require 'rails_helper'

RSpec.describe Liability, type: :model do
  it { expect(create(:liability, :fixed_rate_mortgage)).to be_a Liability }
  it { expect(create(:liability_sample)).to be_a Liability }
  it "save from params" do
    p = build(:liability_sample).to_params
    l = Liability.new(p)
    l.save!
    expect(l.save).to be true
    expect(l).to be_a Liability
    expect(l.liabilityable).to be_a FixedRateMortgage
  end
end
