require 'rails_helper'

RSpec.describe "social_securities/new", type: :view do
  viewsSetup object: :build_social_security,
            user: :person_user, user_path: :switch_user_path

  views_new
end
