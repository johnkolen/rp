require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  viewsSetup object: :create_user,
      	    user: :admin_user

  views_edit
end
