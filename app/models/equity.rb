class Equity < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams
  include StaticDims

  include Assetable
  include SimpleInterest

  validates :return_rate, comparison: { greater_than_or_equal_to: 0 }
  validates :beta, comparison: { greater_than_or_equal_to: 0 }

  static_dim :account_type,
             0 => "Brokerage",
             1 => "Traditional IRA",
             2 => "Roth IRA",
             3 => "SEP IRA",
             4 => "SIMPLE IRA"

  def pretax?
    account_type_id != 0
  end

  def interest_rate
    return_rate || 0
  end

  def update_value year, adjust, frac
    r = (1 + self.return_rate / 100.0 * frac)
    old = self.value
    self.value = self.value * r + adjust * (1 + (r - 1) / 2)
    self.penalties = 0
    if pretax?
      self.taxable_gain = -[adjust, 0].min.round
      self.ssi_taxable_gain = 0
      if adjust < 0
        jan_age = person.age(Date.new(year, 1, 1))
        dec_age = person.age(Date.new(year, 12, 21))
        if dec_age < 59.5
          self.penalties = (-0.1 * adjust).round
        elsif jan_age < 59.5
          self.penalties = (-0.1 * adjust * (59.5 - jan_age)).round
        end
      end
    else
      gain = (self.value - old - adjust).round
      self.taxable_gain = gain
      self.ssi_taxable_gain = gain
    end
  end

end
