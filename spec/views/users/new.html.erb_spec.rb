require 'rails_helper'

RSpec.describe "users/new", type: :view do
  viewsSetup object: :build_user,
            user: :admin_user

  views_new
end
