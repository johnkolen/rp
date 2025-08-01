class CheckingAccount < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Assetable
  include SimpleInterest

  before_validation do
    self.interest_rate = 0 unless self.interest_rate
  end

  validates :interest_rate, comparison: { greater_than_or_equal_to: 0 }
end
