require 'rails_helper'

RSpec.describe Asset, type: :model do
  it { expect(create(:asset, :checking_account)).to be_a Asset }
  it { expect(create(:asset_sample)).to be_a Asset }
  it do
    p = build(:asset_sample).to_params
    expect(p[:assetable_type]).to eq "CheckingAccount"
    expect(p[:assetable_attributes][:interest_rate]).to be_a BigDecimal
    a = Asset.create(p)
    expect(a).to be_a Asset
    expect(a.checking_account).to be_a CheckingAccount
  end
  it do
    p = build(:asset_sample).to_params
    a = Asset.new(p)
    a.save
    expect(a).to be_a Asset
    expect(a.checking_account).to be_a CheckingAccount
  end
end
