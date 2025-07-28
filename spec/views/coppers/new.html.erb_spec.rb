require 'rails_helper'

RSpec.describe "coppers/new", type: :view do
  viewsSetup object: :build_copper,
            user: :person_user, user_path: :switch_user_path

  views_new
end
