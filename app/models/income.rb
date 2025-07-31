class Income < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :incomeable,
                 types: %w[ Employment SocialSecurity ],
                 dependent: :destroy

  accepts_nested_attributes_for :incomeable
  delegate :project, to: :incomeable

  belongs_to :person, inverse_of: :incomes
  # accepts_nested_attributes_for :person

  validates :value, comparison: { greater_than_or_equal_to: 0 }

  def incomeable_type_label
    "Income Type"
  end

  def incomeable_type_options
    self.class.incomeable_types
  end

  def type_title
    return nil unless incomeable_type
    incomeable_type.titleize
  end
end
