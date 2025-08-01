require 'rails_helper'

RSpec.describe Taxes, type: :model do
  let(:taxes) { Taxes.new }
  it { expect(taxes).to be_a Taxes }
  it { expect(taxes.single(2025, 10000)).to eq 0 }
  it { expect(taxes.single(2025, Taxes::SINGLE_STD + 10000)).to eq 1000 }
  it { expect(taxes.single(2025, Taxes::SINGLE_STD + 20000)).to eq 2162 }
end
