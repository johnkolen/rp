require 'rails_helper'

RSpec.describe "properties/show", type: :view do
  viewsSetup object: :create_property,
             user: :admin_user

  views_show
end
