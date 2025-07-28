module Liabilityable
  extend ActiveSupport::Concern

  included do |klass|
    has_one :liability,
            as: :liabilityable,
            inverse_of: :liabilityable,
            touch: true,
            dependent: :destroy
    delegate :value, to: :liability
    delegate :person, to: :liability
    delegate :person_id, to: :liability
    accepts_nested_attributes_for :liability
    def klass.dtparent
      Liability
    end
  end
end
