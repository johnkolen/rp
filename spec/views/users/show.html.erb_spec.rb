require 'rails_helper'

RSpec.describe "users/show", type: :view do
  viewsSetup object: :create_user,
             user: :admin_user

  views_show
end
