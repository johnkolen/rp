require 'rails_helper'

RSpec.describe "employments/new", type: :view do
  viewsSetup object: :build_employment,
            user: :admin_user

  views_new
end
