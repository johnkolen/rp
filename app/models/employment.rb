class Employment < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Incomeable
  include SimpleInterest
  include StaticDims

  validates :gross, comparison: { greater_than_or_equal_to: 0 }
  validates :raise_rate, comparison: { greater_than_or_equal_to: 0 }

  static_dim :taxable_status,
    0 => "None",
    1 => "Single",
    2 => "Married",
    3 => "Single Head of Household"
end
