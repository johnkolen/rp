require 'rails_helper'

RSpec.describe "savings_accounts/new", type: :view do
  viewsSetup object: :build_savings_account,
            user: :admin_user

  views_new
end
