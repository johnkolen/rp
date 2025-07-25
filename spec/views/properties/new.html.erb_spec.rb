require 'rails_helper'

RSpec.describe "properties/new", type: :view do
  viewsSetup object: :build_property,
            user: :admin_user

  views_new
end
