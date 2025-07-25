require 'rails_helper'

RSpec.describe "liabilities/new", type: :view do
  viewsSetup object: :build_liability,
            user: :admin_user

  views_new
end
