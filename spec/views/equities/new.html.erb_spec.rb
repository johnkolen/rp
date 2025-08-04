require 'rails_helper'

RSpec.describe "equities/new", type: :view do
  viewsSetup object: :build_equity,
            user: :person_user, user_path: :switch_user_path

  views_new
end
