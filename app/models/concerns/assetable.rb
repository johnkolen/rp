module Assetable
  extend ActiveSupport::Concern

  included do |klass|
    has_one :asset,
            as: :assetable,
            inverse_of: :assetable,
            touch: true,
            dependent: :destroy
  end
end
