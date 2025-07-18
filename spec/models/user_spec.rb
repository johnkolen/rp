require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(create(:user)).to be_a User }
  it { expect(create(:user_sample)).to be_a User }
end
