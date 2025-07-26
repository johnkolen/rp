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

  static_dim :kindx,
    0 => "None",
    1 => "Primary Residence",
    2 => "Vacation Home",
    3 => "Land",
    4 => "Rental"

  KINDS = {
    0 => "None",
    1 => "Primary Residence",
    2 => "Vacation Home",
    3 => "Land",
    4 => "Rental"
  }
  KINDS.each do |id, label|
    ulabel = label.gsub(" ", "_")
    define_method "#{ulabel.downcase}?" do
      kind_id == id
    end
    const_set "Kind#{ulabel}", id
  end

  def kind_label
    "Kind"
  end

  def kind_sym
    KINDS[kind_id].gsub(" ", "_").downcase.to_sym
  end

  def kind_str
    KINDS[kind_id]
  end

  def kind_options
    KINDS.map { |k, v| [v, k] }
  end

end
