require 'rails_helper'

RSpec.describe "property_taxes/index", type: :view do
  viewsSetup objects: [
               :create_property_tax_sample,
               :create_property_tax_sample
             ],
             user: :admin_user

  views_index
end
