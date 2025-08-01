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
    delegate :name, to: :asset
    delegate :name_str, to: :asset
    delegate :init_value, to: :asset
    delegate :update_value, to: :asset
    delegate :taxable_gain, to: :asset
    delegate :ssi_taxable_gain, to: :asset

    accepts_nested_attributes_for :asset
    def klass.dtparent
      Asset
    end
  end

  def pretax?
    false
  end
end
