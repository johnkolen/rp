module Incomeable
  extend ActiveSupport::Concern

  included do |klass|
    has_one :income,
            as: :incomeable,
            inverse_of: :incomeable,
            touch: true,
            dependent: :destroy
    delegate :amount, to: :income
    delegate :amount=, to: :income
    delegate :start_date, to: :income
    delegate :final_date, to: :income
    delegate :start_date_label, to: :income
    delegate :final_date_label, to: :income
    delegate :person, to: :income
    accepts_nested_attributes_for :income
    def klass.dtparent
      Income
    end
  end
end
