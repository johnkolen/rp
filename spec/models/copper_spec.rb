require 'rails_helper'

RSpec.describe Copper, type: :model do
  it { expect(create(:copper)).to be_a Copper }
  it { expect(create(:copper_sample)).to be_a Copper }
  save_dt_from_params
end
