require 'rails_helper'

RSpec.describe "assets/edit", type: :view do
  viewsSetup object: :create_asset,
      	    user: :admin_user

  views_edit
end
