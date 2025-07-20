require 'rails_helper'

RSpec.describe "savings_accounts/index", type: :view do
  viewsSetup objects: [
               :create_savings_account_sample,
               :create_savings_account_sample
             ],
             user: :admin_user

  views_index
end
