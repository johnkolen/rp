require 'rails_helper'

RSpec.describe "checking_accounts/show", type: :view do
  viewsSetup object: :create_checking_account,
             user: :admin_user

  views_show
end
