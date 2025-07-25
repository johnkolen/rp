require 'rails_helper'

RSpec.describe "property_taxes/show", type: :view do
  viewsSetup object: :create_property_tax,
             user: :admin_user

  views_show
end
