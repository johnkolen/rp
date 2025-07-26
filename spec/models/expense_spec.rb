require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { expect(create(:expense, :property_tax)).to be_a Expense }
  it { expect(create(:expense_sample)).to be_a Expense }
  it "save from params" do
    p = build(:expense_sample).to_params
    e = Expense.new(p)
    e.save
    expect(e).to be_a Expense
    expect(e.expenseable).to be_a PropertyTax
  end
end
