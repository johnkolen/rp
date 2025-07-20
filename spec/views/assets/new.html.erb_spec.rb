require 'rails_helper'

RSpec.describe "assets/new", type: :view do
  viewsSetup object: :build_asset,
            user: :admin_user

  views_new
end
