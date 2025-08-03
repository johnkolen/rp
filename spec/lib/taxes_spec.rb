require 'rails_helper'

RSpec.describe Taxes, type: :model do
  let(:taxes) {Taxes.new}
  it { expect(taxes).to be_a Taxes }
  it { expect(taxes.income_tax 2025, :single, 10000).to eq 0 }
  it { expect(taxes.income_tax 2025, :single, 15750 + 70000).to eq 10314 }
  it { expect((Taxes::MAX_SSI_INCOME_20YR *
               (1 + Taxes::MAX_SSI_INCOME_INCREASE_RATE / 100.0) ** 20 -
               Taxes::MAX_SSI_INCOME).abs).to be < 100}
end
