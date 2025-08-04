module Liabilityable
  extend ActiveSupport::Concern
  include DTMissing

  included do |klass|
    has_one :liability,
            as: :liabilityable,
            inverse_of: :liabilityable,
            touch: true,
            dependent: :destroy
    accepts_nested_attributes_for :liability
    def klass.dtparent
      Liability
    end
  end

  # this is for DTMissing
  def dtparent
    liability
  end
end
