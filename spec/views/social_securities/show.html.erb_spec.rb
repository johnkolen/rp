require 'rails_helper'

RSpec.describe "social_securities/show", type: :view do
  viewsSetup object: :create_social_security,
             user: :person_user, user_path: :switch_user_path

  views_show
end
