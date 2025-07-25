require 'rails_helper'

RSpec.describe "incomes/edit", type: :view do
  viewsSetup object: :create_income,
      	    user: :admin_user

  views_edit
end
