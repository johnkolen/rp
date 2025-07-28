require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  viewsSetup object: :create_expense_sample,
             user: :person_user,
             user_path: :switch_user_path

  views_edit
end
