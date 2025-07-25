require 'rails_helper'

RSpec.describe "liabilities/show", type: :view do
  viewsSetup object: :create_liability,
             user: :admin_user

  views_show
end
