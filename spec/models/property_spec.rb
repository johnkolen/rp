require 'rails_helper'

RSpec.describe Property, type: :model do
  it { expect(create(:property)).to be_a Property }
  it { expect(create(:property_sample)).to be_a Property }
end
