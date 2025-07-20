class Asset < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :assetable,
                 types: %w[CheckingAccount SavingsAccount],
                 dependent: :destroy

  validates :value, comparison: { greater_than_or_equal_to: 0 }
end
