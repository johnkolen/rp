class Expense < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams
  include StaticDims

  delegated_type :expenseable,
                 types: %w[ PropertyTax ],
                 dependent: :destroy

  accepts_nested_attributes_for :expenseable
  delegate :project, to: :expenseable

  belongs_to :person, inverse_of: :expenses

  validates :amount, comparison: { greater_than_or_equal_to: 0 }

  def expenseable_type_label
    "Expense Type"
  end

  def expenseable_type_options
    self.class.expenseable_types
  end

  def type_title
    return nil unless expenseable_type
    expenseable_type.titleize
  end

  static_dim :frequency,
    0 => "Monthly",
    1 => "Weekly",
    2 => "Biweekly",
    3 => "Semi-monthly",
    4 => "Quarterly",
    5 => "Semi-yearly",
    6 => "Yearly"

  FA = [12, 52, 26, 24, 4, 1, 2]
  def frequency_adjust
    FA[frequency_id || 0]
  end

  def init_amount year
    if (!start_date || start_date.year <= year) &&
       (!final_date || year < final_date.year)
      @original_amount = self.amount
      self.amount = amount * frequency_adjust
    else
      self.amount = 0
    end
  end

  def update_amount year, inflation=0.0
    if start_date && year < start_date
      self.amount = 0
      return
    end
    if !final_date || year < final_date.year
      if start_date && start_date.year == year
        frac = 1 - start_date.yday / Date.new(year, 12, 31).yday.to_f
        self.amount = frac * (self.amount * (1 + inflation / 100.0)).round if inflation
      else
        self.amount = (self.amount * (1 + inflation / 100.0)).round if inflation
      end
    elsif year == final_date.year
      frac = final_date.yday / Date.new(year, 12, 31).yday.to_f
      self.amount = (frac * self.amount * (1 + inflation / 100.0)).round if inflation
    else
      self.amount = 0
    end
  end
end
