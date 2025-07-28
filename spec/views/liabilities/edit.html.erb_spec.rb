require 'rails_helper'

RSpec.describe "liabilities/edit", type: :view do
  viewsSetup object: :create_liability_sample,
             user: :person_user,
             user_path: :switch_user_path

  views_edit
end
