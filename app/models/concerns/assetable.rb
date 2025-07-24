module Assetable
  extend ActiveSupport::Concern

  included do |klass|
    has_one :asset,
            as: :assetable,
            inverse_of: :assetable,
            touch: true,
            dependent: :destroy
    delegate :value, to: :asset
    delegate :person, to: :asset
    accepts_nested_attributes_for :asset
  end
end
