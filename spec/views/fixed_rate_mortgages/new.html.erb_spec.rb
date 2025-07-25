require 'rails_helper'

RSpec.describe "fixed_rate_mortgages/new", type: :view do
  viewsSetup object: :build_fixed_rate_mortgage,
            user: :admin_user

  views_new
end
