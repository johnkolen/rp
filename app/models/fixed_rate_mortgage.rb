class FixedRateMortgage < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Liabilityable
  include SimpleInterest

  belongs_to :property

  validates :interest_rate, comparison: { greater_than_or_equal_to: 0 }
end
