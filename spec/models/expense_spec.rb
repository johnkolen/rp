require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { expect(create(:expense, :property_tax)).to be_a Expense }
  it { expect(create(:expense_sample)).to be_a Expense }
end
