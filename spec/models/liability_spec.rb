require 'rails_helper'

RSpec.describe Liability, type: :model do
  it { expect(create(:liability, :fixed_rate_mortgage)).to be_a Liability }
  it { expect(create(:liability_sample)).to be_a Liability }
end
