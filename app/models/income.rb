class Income < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  delegated_type :incomeable,
                 types: %w[ Employment SocialSecurity ],
                 dependent: :destroy

  accepts_nested_attributes_for :incomeable
  delegate :project, to: :incomeable

  belongs_to :person, inverse_of: :incomes
  # accepts_nested_attributes_for :person

  before_validation do
    unless self.amount
      if self.incomeable.respond_to? :net_amount
        self.amount = incomeable.net_amount
      else
        self.amount = 0
      end
    end
  end

  validates :amount, comparison: { greater_than_or_equal_to: 0 }
  validates :final_date, comparison: { greater_than_or_equal_to: :start_date }

  def incomeable_type_label
    "Income Type"
  end

  def incomeable_type_options
    self.class.incomeable_types
  end

  def type_title
    return nil unless incomeable_type
    incomeable_type.titleize
  end

end
