require 'rails_helper'

RSpec.describe "employments/show", type: :view do
  viewsSetup object: :create_employment,
             user: :admin_user

  views_show
end
