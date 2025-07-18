require 'rails_helper'

RSpec.describe "users/index", type: :view do
  viewsSetup objects: [
               :create_user_sample,
               :create_user_sample
             ],
             user: :admin_user

  views_index
end
