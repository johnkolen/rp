class Asset < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :assetable,
                 types: %w[ CheckingAccount SavingsAccount Property Equity ],
                 dependent: :destroy

  accepts_nested_attributes_for :assetable
  delegate :project, to: :assetable # project method
  delegate :pretax?, to: :assetable

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

  def init_value year
    raise "no value" unless value
  end

  def interest_rate
    if assetable.respond_to? :interest_rate
      assetable.interest_rate
    else
      0
    end
  end

  attr_accessor :taxable_gain
  attr_accessor :ssi_taxable_gain
  attr_accessor :penalties

  def update_value year, adjust, frac
    r = (1 + self.interest_rate / 100.0 * frac)
    old = self.value
    self.value = self.value * r + adjust * (1 + (r - 1) / 2)
    penalties = 0
    if pretax?
      @taxable_gain = -[adjust, 0].min
      @ssi_taxable_gain = 0
    else
      gain = self.value - old - adjust
      @taxable_gain = gain
      @ssi_taxable_gain = gain
    end
  end
end
