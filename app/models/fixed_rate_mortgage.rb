class FixedRateMortgage < ApplicationRecord
  include ObjectView::MetaAttributes
  include ObjectView::Dims
  include ObjectView::ToParams

  include Liabilityable
  include SimpleInterest

  belongs_to :property, inverse_of: :fixed_rate_mortgages
  # accepts_nested_attributes_for :property

  validates :interest_rate, comparison: { greater_than_or_equal_to: 0 }

  def property_options
    return [] unless liability
    if person
      person.properties.map{|p| [p.name, p.id]}
    elsif person_id
      Person.find(person_id).properties.map{|p| [p.name, p.id]}
    else
      []
    end
  end
end
