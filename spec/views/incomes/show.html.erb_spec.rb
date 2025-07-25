require 'rails_helper'

RSpec.describe "incomes/show", type: :view do
  viewsSetup object: :create_income,
             user: :admin_user

  views_show
end
