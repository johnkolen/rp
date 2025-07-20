require 'rails_helper'

RSpec.describe SavingsAccount, type: :model do
  it { expect(create(:savings_account)).to be_a SavingsAccount }
  it { expect(create(:savings_account_sample)).to be_a SavingsAccount }
end
