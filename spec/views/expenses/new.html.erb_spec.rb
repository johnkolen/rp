require 'rails_helper'

RSpec.describe "expenses/new", type: :view do
  viewsSetup object: :build_expense,
            user: :admin_user

  views_new
end
