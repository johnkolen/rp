class Expense < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :expenseable,
                 types: %w[ CheckingAccount SavingsAccount Property],
                 dependent: :destroy

  accepts_nested_attributes_for :expenseable
  delegate :project, to: :expenseable

  belongs_to :person, inverse_of: :expenses

  validates :amount, comparison: { greater_than_or_equal_to: 0 }

  def expenseable_type_label
    "Expense Type"
  end

  def expenseable_type_options
    self.class.expenseable_types
  end

  def type_title
    return nil unless expenseable_type
    expenseable_type.titleize
  end
end
