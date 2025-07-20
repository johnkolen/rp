module Assetable
  extend ActiveSupport::Concern

  included do
    has_one :asset, as: :assetable, touch: true
  end
end
