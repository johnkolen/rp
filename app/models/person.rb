class Person < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  belongs_to :user, inverse_of: :person, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, comparison: { less_than: Date.today - 10.years }
end
