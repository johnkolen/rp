require 'rails_helper'

RSpec.describe CheckingAccount, type: :model do
  it { expect(create(:checking_account)).to be_a CheckingAccount }
  it { expect(create(:checking_account_sample)).to be_a CheckingAccount }
  it do
    c = build(:checking_account)
    #puts c.to_params
    #puts c.inspect
    #puts c.asset.inspect
  end
  it do
    c = create(:checking_account)
    #puts c.inspect
    #puts c.asset.inspect
  end
end
