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
  end
end
