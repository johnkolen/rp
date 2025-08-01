class Liability < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :liabilityable,
                 types: %w[ FixedRateMortgage ],
                 dependent: :destroy

  accepts_nested_attributes_for :liabilityable
  delegate :project, to: :liabilityable

  belongs_to :person, inverse_of: :liabilities

  validates :value, comparison: { greater_than_or_equal_to: 0 }

  def liabilityable_type_label
    "Liability Type"
  end

  def liabilityable_type_options
    self.class.liabilityable_types
  end

  def type_title
    return nil unless liabilityable_type
    liabilityable_type.titleize
  end

  def payment year
    @payment
  end

  def init_value year
    if 0 < value
      @payment = liabilityable.pi_payment * 12
    else
      @payment = 0
    end
    if value < @payment
      @payment = value
    end
  end

  def interest_rate
    liabilityable.interest_rate
  end

  def update_value year, frac=1
    return if value == 0
    months = (12 * frac).ceil
    pi = @payment / months
    months.times do
      self.value += value * (interest_rate / 100.0 / 12) - pi
    end
    if value < 1
      self.value = 0
      @payment = 0
    elsif value < @payment
      @payment = value * (1 + interest_rate / 100.0)
    end
  end
end
