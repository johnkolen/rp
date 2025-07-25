module Liabilityable
  extend ActiveSupport::Concern

  included do |klass|
    has_one :liability,
            as: :liabilityable,
            inverse_of: :liabilityable,
            touch: true,
            dependent: :destroy
    delegate :value, to: :asset
    delegate :person, to: :asset
    accepts_nested_attributes_for :liability
  end
end
