module Incomeable
  extend ActiveSupport::Concern
  include DTMissing

  included do |klass|
    has_one :income,
            as: :incomeable,
            inverse_of: :incomeable,
            touch: true,
            dependent: :destroy
    accepts_nested_attributes_for :income
    def klass.dtparent
      Income
    end
  end

  include DTMissing
  # this is for DTMissing
  def dtparent
    income
  end

end
