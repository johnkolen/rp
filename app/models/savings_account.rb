class SavingsAccount < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Assetable
  include SimpleInterest

  validates :interest_rate, comparison: { greater_than_or_equal_to: 0 }
end
