class Asset < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :assetable,
                 types: %w[ CheckingAccount SavingsAccount Property],
                 dependent: :destroy

  accepts_nested_attributes_for :assetable
  delegate :project, to: :assetable # project method

  belongs_to :person, inverse_of: :assets

  validates :value, comparison: { greater_than_or_equal_to: 0 }

  def assetable_type_label
    "Asset Type"
  end

  def assetable_type_options
    self.class.assetable_types
  end

  def type_title
    return nil unless assetable_type
    assetable_type.titleize
  end
end
