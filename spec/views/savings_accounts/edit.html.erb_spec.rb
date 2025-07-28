require 'rails_helper'

RSpec.describe "savings_accounts/edit", type: :view do
  viewsSetup object: :create_savings_account,
            user: :admin_user

  views_edit
end
