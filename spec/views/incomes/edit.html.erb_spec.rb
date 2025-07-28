require 'rails_helper'

RSpec.describe "incomes/edit", type: :view do
  viewsSetup object: :create_income_sample,
             user: :person_user,
             user_path: :switch_user_path

  views_edit
end
