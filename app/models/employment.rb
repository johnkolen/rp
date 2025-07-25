class Employment < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Incomeable
  include SimpleInterest

  validates :raise_rate, comparison: { greater_than_or_equal_to: 0 }
  TAXABLE_STATUS = {
    0 => "None",
    1 => "Primary Residence",
    2 => "Vacation Home",
    3 => "Land",
    4 => "Rental"
  }

  TAXABLE_STATUS.each do |id, label|
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
    TAXABLE_STATUS[kind_id].gsub(" ", "_").downcase.to_sym
  end

  def kind_str
    TAXABLE_STATUS[kind_id]
  end

  def kind_options
    TAXABLE_STATUS.map { |k, v| [v, k] }
  end
end
