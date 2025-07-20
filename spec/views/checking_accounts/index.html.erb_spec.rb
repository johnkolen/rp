require 'rails_helper'

RSpec.describe "checking_accounts/index", type: :view do
  viewsSetup objects: [
               :create_checking_account_sample,
               :create_checking_account_sample
             ],
             user: :admin_user

  views_index
end
