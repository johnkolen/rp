module Incomeable
  extend ActiveSupport::Concern

  included do |klass|
    has_one :income,
            as: :incomeable,
            inverse_of: :incomeable,
            touch: true,
            dependent: :destroy
    delegate :value, to: :income
    delegate :person, to: :income
    accepts_nested_attributes_for :income
  end
end
