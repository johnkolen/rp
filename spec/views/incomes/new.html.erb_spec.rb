require 'rails_helper'

RSpec.describe "incomes/new", type: :view do
  viewsSetup object: :build_income,
            user: :admin_user

  views_new
end
