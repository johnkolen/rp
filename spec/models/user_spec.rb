require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(create(:user)).to be_a User }
  it { expect(create(:user_sample)).to be_a User }
  it { expect(create(:user).role_id).to eq User::RoleUser }
  it "roles" do
    expect(User::ROLE).to be_a Hash
    expect(User.new.role_options).to be_a Array
  end
end
