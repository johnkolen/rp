class PropertyTax < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Expenseable
  include SimpleInterest

  belongs_to :property, inverse_of: :property_tax

  validates :increase_rate, comparison: { greater_than_or_equal_to: 0 }
end
