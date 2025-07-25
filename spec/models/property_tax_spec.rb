require 'rails_helper'

RSpec.describe PropertyTax, type: :model do
  it { expect(create(:property_tax)).to be_a PropertyTax }
  it { expect(create(:property_tax_sample)).to be_a PropertyTax }
end
