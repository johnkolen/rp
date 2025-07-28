require 'rails_helper'

RSpec.describe Employment, type: :model do
  it { expect(create(:employment)).to be_a Employment }
  it { expect(create(:employment_sample)).to be_a Employment }
  save_dt_from_params
end
