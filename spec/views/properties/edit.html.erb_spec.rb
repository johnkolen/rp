require 'rails_helper'

RSpec.describe "properties/edit", type: :view do
  viewsSetup object: :create_property,
            user: :admin_user

  views_edit
end
