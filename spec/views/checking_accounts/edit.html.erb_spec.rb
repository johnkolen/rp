require 'rails_helper'

RSpec.describe "checking_accounts/edit", type: :view do
  viewsSetup object: :create_checking_account,
             user: :person_user,
             user_path: :switch_user_path

  views_edit
end
