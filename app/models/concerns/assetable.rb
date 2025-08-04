module Assetable
  extend ActiveSupport::Concern
  include DTMissing

  included do |klass|
    has_one :asset,
            as: :assetable,
            inverse_of: :assetable,
            touch: true,
            dependent: :destroy
    accepts_nested_attributes_for :asset
    def klass.dtparent
      Asset
    end
  end

  def pretax?
    false
  end

  # this is for DTMissing
  def dtparent
    asset
  end
end
