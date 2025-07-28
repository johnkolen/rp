require 'rails_helper'

RSpec.describe "coppers/show", type: :view do
  viewsSetup object: :create_copper,
             user: :person_user, user_path: :switch_user_path

  views_show
end
