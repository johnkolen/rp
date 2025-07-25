require 'rails_helper'

RSpec.describe "employments/edit", type: :view do
  viewsSetup object: :create_employment,
      	    user: :admin_user

  views_edit
end
