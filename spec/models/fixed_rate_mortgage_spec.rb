require 'rails_helper'

RSpec.describe FixedRateMortgage, type: :model do
  it { expect(create(:fixed_rate_mortgage)).to be_a FixedRateMortgage }
  it { expect(create(:fixed_rate_mortgage_sample)).to be_a FixedRateMortgage }
  save_dt_from_params do |dt|
    expect(dt.property).to be_a Property
  end
end
