require 'rails_helper'

RSpec.describe "fixed_rate_mortgages/show", type: :view do
  viewsSetup object: :create_fixed_rate_mortgage,
             user: :admin_user

  views_show
end
