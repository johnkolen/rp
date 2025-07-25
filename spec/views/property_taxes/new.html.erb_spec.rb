require 'rails_helper'

RSpec.describe "property_taxes/new", type: :view do
  viewsSetup object: :build_property_tax,
            user: :admin_user

  views_new
end
