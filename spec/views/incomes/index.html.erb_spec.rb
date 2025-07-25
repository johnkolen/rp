require 'rails_helper'

RSpec.describe "incomes/index", type: :view do
  viewsSetup objects: [
               :create_income_sample,
               :create_income_sample
             ],
             user: :admin_user

  views_index
end
