class Property < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams
  include StaticDims

  include Assetable
  include SimpleInterest

  has_one :property_tax, inverse_of: :property
  has_many :fixed_rate_mortgages, inverse_of: :property

  validates :appreciation_rate, comparison: { greater_than_or_equal_to: 0 }

  static_dim :kind,
    0 => "None",
    1 => "Primary Residence",
    2 => "Vacation Home",
    3 => "Land",
    4 => "Rental"

end
