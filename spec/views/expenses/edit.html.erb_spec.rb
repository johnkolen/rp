require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  viewsSetup object: :create_expense,
      	    user: :admin_user

  views_edit
end
