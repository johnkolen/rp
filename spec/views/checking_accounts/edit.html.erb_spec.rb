require 'rails_helper'

RSpec.describe "checking_accounts/edit", type: :view do
  viewsSetup object: :create_checking_account,
      	    user: :admin_user

  views_edit
end
