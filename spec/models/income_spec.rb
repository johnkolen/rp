require 'rails_helper'

RSpec.describe Income, type: :model do
  it { expect(create(:income, :employment)).to be_a Income }
  it { expect(create(:income_sample)).to be_a Income }
end
