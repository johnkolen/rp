require 'rails_helper'

RSpec.describe Income, type: :model do
  it { expect(create(:income, :employment)).to be_a Income }
  it { expect(create(:income_sample)).to be_a Income }
  it "save from params" do
    p = build(:income_sample).to_params
    i = Income.new(p)
    expect(i.save).to be true
    expect(i).to be_a Income
    expect(i.incomeable).to be_a Employment
  end
end
