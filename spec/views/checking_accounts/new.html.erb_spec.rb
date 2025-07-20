require 'rails_helper'

RSpec.describe "checking_accounts/new", type: :view do
  viewsSetup object: :build_checking_account,
            user: :admin_user

  views_new
end
