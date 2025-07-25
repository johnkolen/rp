require 'rails_helper'

RSpec.describe "liabilities/edit", type: :view do
  viewsSetup object: :create_liability,
      	    user: :admin_user

  views_edit
end
