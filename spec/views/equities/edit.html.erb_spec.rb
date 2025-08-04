require 'rails_helper'

RSpec.describe "equities/edit", type: :view do
  viewsSetup object: :create_equity,
      	    user: :person_user, user_path: :switch_user_path

  views_edit
end
