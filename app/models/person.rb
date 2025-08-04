class Person < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  belongs_to :user, inverse_of: :person, optional: true
  has_many :assets, inverse_of: :person
  has_many :liabilities, inverse_of: :person
  has_many :incomes, inverse_of: :person
  has_many :expenses, inverse_of: :person
  # This should be a has_many, but could not get it to work
  def properties
    assets.where(assetable_type: "Property").map(&:property)
  end
  # scope :properties,

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, comparison: { less_than: Date.today - 10.years }

  def project_assets
    h = Hash.new { |h, k| h[k] = 0 }
    assets.each do |a|
      a.project.each do |year, value|
        h[year] += value
      end
    end
    h.to_a.sort
  end

  def age now=nil
    now ||= Date.today
    days = now - self.birthdate
    years = (days / 365).floor
    bx = Date.new(years + self.birthdate.year,
                  self.birthdate.month,
                  self.birthdate.day)
    ex = Date.new(1 + years + self.birthdate.year,
                  self.birthdate.month,
                  self.birthdate.day)
    years + (now - bx) / (ex - bx).to_f
  end

end
