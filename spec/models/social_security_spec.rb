require 'rails_helper'

RSpec.describe SocialSecurity, type: :model do
  it { expect(create(:social_security)).to be_a SocialSecurity }
  it { expect(create(:social_security_sample)).to be_a SocialSecurity }
  save_dt_from_params
end
