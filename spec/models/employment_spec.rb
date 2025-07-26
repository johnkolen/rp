require 'rails_helper'

RSpec.describe Employment, type: :model do
  it { expect(create(:employment)).to be_a Employment }
  it { expect(create(:employment_sample)).to be_a Employment }
  it "save from params" do
    p = build(:employment_sample).to_params
    x = Employment.new(p)
    expect(x.save).to be true
    expect(x).to be_a Employment
    expect(x.income).to be_a Income
  end
end
