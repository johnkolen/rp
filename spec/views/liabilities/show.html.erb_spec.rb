require 'rails_helper'

RSpec.describe "liabilities/show", type: :view do
  viewsSetup object: :create_liability_sample,
             user: :person_user,
             user_path: :switch_user_path

  views_show
end
