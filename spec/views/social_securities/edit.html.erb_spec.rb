require 'rails_helper'

RSpec.describe "social_securities/edit", type: :view do
  viewsSetup object: :create_social_security,
      	    user: :person_user, user_path: :switch_user_path

  views_edit
end
