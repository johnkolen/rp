require 'rails_helper'

RSpec.describe "fixed_rate_mortgages/index", type: :view do
  viewsSetup objects: [
               :create_fixed_rate_mortgage_sample,
               :create_fixed_rate_mortgage_sample
             ],
             user: :admin_user

  views_index
end
