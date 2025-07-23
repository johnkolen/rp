class Person < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  belongs_to :user, inverse_of: :person, optional: true
  has_many :assets, inverse_of: :person

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, comparison: { less_than: Date.today - 10.years }

  def project_assets
    h = Hash.new{|h, k| h[k] = 0}
    assets.each do |a|
      a.project.each do |year, value|
        h[year] += value
      end
    end
    h.to_a.sort
  end

end
