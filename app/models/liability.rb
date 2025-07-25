class Liability < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :liabilityable,
                 types: %w[ CheckingAccount SavingsAccount Property],
                 dependent: :destroy

  accepts_nested_attributes_for :liabilityable
  delegate :project, to: :liabilityable

  belongs_to :person, inverse_of: :liabilities

  validates :value, comparison: { greater_than_or_equal_to: 0 }

  def liabilityable_type_label
    "Liability Type"
  end

  def liabilityable_type_options
    self.class.liabilityable_types
  end

  def type_title
    return nil unless liabilityable_type
    liabilityable_type.titleize
  end
end
