require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  viewsSetup objects: [
               :create_expense_sample,
               :create_expense_sample
             ],
             user: :admin_user

  views_index
end
