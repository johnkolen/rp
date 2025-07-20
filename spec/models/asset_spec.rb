require 'rails_helper'

RSpec.describe Asset, type: :model do
  it { expect(create(:asset)).to be_a Asset }
  it { expect(create(:asset_sample)).to be_a Asset }
end
