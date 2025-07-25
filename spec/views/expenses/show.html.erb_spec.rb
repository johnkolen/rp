require 'rails_helper'

RSpec.describe "expenses/show", type: :view do
  viewsSetup object: :create_expense,
             user: :admin_user

  views_show
end
