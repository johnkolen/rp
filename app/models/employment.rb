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

  def ssi_label
    "Social Security Withheld"
  end

  def net_amount
    gross * 0.6
  end

  def init_amount year
    if !final_date ||
       start_date.year < year && year < final_date.year
      self.amount ||= net_amount
    end
  end

  def taxable_amount
    self.amount
  end

  def ssi_taxable_amount
    self.amount if ssi
  end

  def update_amount year
    if !final_date || year < final_date.year
      self.amount = (self.amount * (1 + raise_rate / 100.0)).round if raise_rate
    elsif year == final_date.year
      frac = final_date.yday / Date.new(year, 12, 31).yday.to_f
      self.amount = (frac * self.amount * (1 + raise_rate / 100.0)).round if raise_rate
    else
      self.amount = 0
    end
  end
end
