module Expenseable
  extend ActiveSupport::Concern
  include DTMissing

  included do |klass|
    has_one :expense,
            as: :expenseable,
            inverse_of: :expenseable,
            touch: true,
            dependent: :destroy
    accepts_nested_attributes_for :expense
    def klass.dtparent
      Expense
    end
  end

  # this is for DTMissing
  def dtparent
    expense
  end
end
