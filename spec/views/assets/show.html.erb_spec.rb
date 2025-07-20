require 'rails_helper'

RSpec.describe "assets/show", type: :view do
  viewsSetup object: :create_asset,
             user: :admin_user

  views_show
end
