require 'rails_helper'

RSpec.describe "employments/index", type: :view do
  viewsSetup objects: [
               :create_employment_sample,
               :create_employment_sample
             ],
             user: :admin_user

  views_index
end
