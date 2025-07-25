require 'rails_helper'

RSpec.describe FixedRateMortgage, type: :model do
  it { expect(create(:fixed_rate_mortgage)).to be_a FixedRateMortgage }
  it { expect(create(:fixed_rate_mortgage_sample)).to be_a FixedRateMortgage }
end
