module Expenseable
  extend ActiveSupport::Concern

  included do |klass|
    has_one :expense,
            as: :expenseable,
            inverse_of: :expenseable,
            touch: true,
            dependent: :destroy
    delegate :value, to: :expense
    delegate :person, to: :expense
    accepts_nested_attributes_for :expense
    def klass.dtparent
      Expense
    end
  end
end
