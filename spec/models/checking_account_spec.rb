require 'rails_helper'

RSpec.describe CheckingAccount, type: :model do
  it { expect(create(:checking_account)).to be_a CheckingAccount }
  it { expect(create(:checking_account_sample)).to be_a CheckingAccount }
  save_dt_from_params
end
